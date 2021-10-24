#! /usr/bin/env python3


import logging
import os
import sys
import shutil
import time
import numpy as np
import tensorflow as tf
import tensorlayer as tl
from tensorflow.python.saved_model import builder as saved_model_builder
from tensorflow.python.saved_model import signature_constants
from tensorflow.python.saved_model import signature_def_utils
from tensorflow.python.saved_model import tag_constants
from tensorflow.python.saved_model import utils
from tensorflow.python.util import compat
from sklearn.model_selection import train_test_split


def load_dataset(files, test_size=0.2):
    """加载数据集
    """
    x = []
    y = []
    for file in files:
        data = np.load(file)
        if x == [] or y == []:
            x = data['x']
            y = data['y']
        else:
            x = np.append(x, data['x'], axis=0)
            y = np.append(y, data['y'], axis=0)

    x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=test_size)
    return x_train, y_train, x_test, y_test


def network(x, keep=0.8):
    """定义网络结构
    """
    network = tl.layers.InputLayer(x, name='input_layer')
    network = tl.layers.DropoutLayer(network, keep=keep, name='drop1', is_fix=True)
    network = tl.layers.DenseLayer(network, n_units=200, act=tf.nn.relu, name='relu1')
    network = tl.layers.DropoutLayer(network, keep=keep, name='drop2', is_fix=True)
    network = tl.layers.DenseLayer(network, n_units=200, act=tf.nn.relu, name='relu')
    network = tl.layers.DropoutLayer(network, keep=keep, name='drop3', is_fix=True)
    network = tl.layers.DenseLayer(network, n_units=7, act=tf.identity, name='output_layer')
    network.outputs_op = tf.argmax(tf.nn.softmax(network.outputs), 1)
    return network


def load_checkpoint(sess, ckpt_file):
    """恢复模型训练状态
    """
    index = ckpt_file + ".index"
    meta = ckpt_file + ".meta"
    if os.path.isfile(index) and os.path.isfile(meta):
        tf.train.Saver().restore(sess, ckpt_file)


def save_checkpoint(sess, ckpt_file):
    """保存模型训练状态
    """
    path = os.path.dirname(os.path.abspath(ckpt_file))
    if os.path.isdir(path) == False:
        logging.warning('Path (%s) not exists, making directories...', path)
        os.makedirs(path)
    tf.train.Saver().save(sess, ckpt_file)


def train(sess, inputs, network):
    """训练网络
    """
    labels = tf.placeholder(tf.int64, shape=[None, ], name='labels')
    loss = tl.cost.cross_entropy(network.outputs, labels, 'xentropy')
    train_op = tf.train.AdamOptimizer().minimize(loss)

    X_train, y_train, X_test, y_test = load_dataset(
        ['../data/output/sample.npz'])

    sess.run(tf.global_variables_initializer())
    load_checkpoint(sess, ckpt_file)

    n_epoch = 500
    batch_size = 128
    print_freq = 5
    logging.info("batch_size: %d", batch_size)
    logging.info("Start training the network...")
    start_time_begin = time.time()
    for epoch in range(n_epoch):
        start_time = time.time()
        for X_train_a, y_train_a in tl.iterate.minibatches(X_train, y_train, batch_size, shuffle=True):
            feed_dict = {inputs: X_train_a, labels: y_train_a}
            # feed_dict.update(network.all_drop)
            sess.run(train_op, feed_dict=feed_dict)
        if epoch + 1 == 1 or (epoch + 1) % print_freq == 0:
            logging.info("Epoch %d of %d took %fs", epoch + 1, n_epoch, time.time() - start_time)
            # disable all dropout layers
            # dp_dict = tl.utils.dict_to_one(network.all_drop)
            feed_dict = {inputs: X_train, labels: y_train}
            # feed_dict.update(dp_dict)
            logging.info("    train loss: %f", sess.run(loss, feed_dict=feed_dict))
            save_checkpoint(sess, ckpt_file)

    logging.info('Evaluation:')
    # dp_dict = tl.utils.dict_to_one(network.all_drop)
    feed_dict = {inputs: X_test, labels: y_test}
    # feed_dict.update(dp_dict)
    logging.info("    test loss: %f", sess.run(loss, feed_dict=feed_dict))
    logging.info("    test acc: %f", np.mean(y_test == sess.run(network.outputs_op, feed_dict=feed_dict)))


def export(model_version, model_dir, sess, inputs, y_op):
    """导出模型
    """
    if model_version <= 0:
        print('Please specify a positive value for version number.')
        sys.exit()

    path = os.path.dirname(os.path.abspath(model_dir))
    if os.path.isdir(path) == False:
        logging.warning('Path (%s) not exists, making directories...', path)
        os.makedirs(path)

    export_path = os.path.join(
        compat.as_bytes(model_dir),
        compat.as_bytes(str(model_version)))

    if os.path.isdir(export_path) == True:
        logging.warning('Path (%s) exists, removing directories...', export_path)
        shutil.rmtree(export_path)

    builder = saved_model_builder.SavedModelBuilder(export_path)
    tensor_info_x = utils.build_tensor_info(inputs)
    tensor_info_y = utils.build_tensor_info(y_op)

    prediction_signature = signature_def_utils.build_signature_def(
        inputs={'x': tensor_info_x},
        outputs={'y': tensor_info_y},
        method_name=signature_constants.PREDICT_METHOD_NAME)

    builder.add_meta_graph_and_variables(
        sess,
        [tag_constants.SERVING],
        signature_def_map={
            'predict_text': prediction_signature,
            signature_constants.DEFAULT_SERVING_SIGNATURE_DEF_KEY: prediction_signature
        })

    builder.save()


if __name__ == '__main__':
    fmt = "%(asctime)s %(levelname)s %(message)s"
    logging.basicConfig(format=fmt, level=logging.INFO)

    ckpt_file = './mlp_checkpoint/mlp.ckpt'
    x = tf.placeholder(tf.float32, shape=[None, 200], name='inputs')
    sess = tf.InteractiveSession()

    flags = tf.flags
    flags.DEFINE_string("mode", "train", "train or export")
    FLAGS = flags.FLAGS

    if FLAGS.mode == "train":
        network = network(x)
        train(sess, x, network)
        logging.info("Optimization Finished!")
    elif FLAGS.mode == "export":
        model_version = 1
        model_dir = 'old/output/mlp_model'
        network = network(x, keep=1.0)
        sess.run(tf.global_variables_initializer())
        load_checkpoint(sess, ckpt_file)
        export(model_version, model_dir, sess, x, network.outputs_op)
        logging.info("Servable Export Finishied!")
