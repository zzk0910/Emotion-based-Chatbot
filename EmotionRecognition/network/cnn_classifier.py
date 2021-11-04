#! /usr/bin/env python3

import logging
import math
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


def data_process(x_train, y_train, x_test, y_test):
    # train
    delete_list = []
    for i in range(len(x_train)):
        y = y_train[i]
        if y == 0:
            delete_list.append(i)
    delete_list = np.array(delete_list)
    x_train = np.delete(x_train, delete_list)
    y_train = np.delete(y_train, delete_list)
    # test
    delete_list = []
    for i in range(len(x_test)):
        y = y_test[i]
        if y == 0:
            delete_list.append(i)

    delete_list = np.array(delete_list)
    x_test = np.delete(x_test, delete_list)
    y_test = np.delete(y_test, delete_list)
    # redefine y
    y_train = y_train - 1
    y_test = y_test - 1

    return x_train, y_train, x_test, y_test







def network(x, keep=0.8):
    """定义网络结构
    """
    network = tl.layers.InputLayer(x, name='input_layer')
    network = tl.layers.Conv1dLayer(network, act=tf.nn.relu, shape=[3, 200, 6], name='cnn_layer1', padding='VALID')
    network = tl.layers.MaxPool1d(network, filter_size=3, strides=3, name='pool_layer1')
    network = tl.layers.FlattenLayer(network, name='flatten_layer')
    network = tl.layers.DropoutLayer(network, keep=keep, name='drop1', is_fix=True)
    network = tl.layers.DenseLayer(network, n_units=6, act=tf.identity, name="output")
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


def train(sess, x, network):
    """训练网络
    """
    learning_rate = 0.1
    n_classes = 1  # linear sequence or not
    y = tf.placeholder(tf.int64, [None, ], name="labels")
    cost = tl.cost.cross_entropy(network.outputs, y, 'xentropy')
    optimizer = tf.train.AdamOptimizer(learning_rate=learning_rate).minimize(cost)
    correct = tf.equal(network.outputs_op, y)
    accuracy = tf.reduce_mean(tf.cast(correct, tf.float32))

    x_train, y_train, x_test, y_test = load_dataset(
        ["../data/output/sample_seq.npz"])
    x_train, y_train, x_test, y_test = data_process(x_train, y_train, x_test, y_test)
    sess.run(tf.global_variables_initializer())
    load_checkpoint(sess, ckpt_file)

    n_epoch = 50
    batch_size = 128
    display_step = 100
    global max_seq_len
    logging.info("batch_size: %d", batch_size)
    logging.info("Start training the network...")
    for epoch in range(n_epoch):
        step = 0
        total_step = math.ceil(len(x_train) / batch_size)
        for batch_x, batch_y in tl.iterate.minibatches(x_train, y_train, batch_size, shuffle=True):
            start_time = time.time()
            for i, d in enumerate(batch_x):
                batch_x[i] = batch_x[i][:max_seq_len]
                batch_x[i] += [np.zeros(200) for i in range(max_seq_len - len(d))]
            # ValueError: setting an array element with a sequence.
            batch_x = list(batch_x)

            feed_dict = {x: batch_x, y: batch_y}
            sess.run(optimizer, feed_dict)
            if step + 1 == 1 or (step + 1) % display_step == 0:
                logging.info("Epoch %d/%d Step %d/%d of %d took %fs", epoch + 1, n_epoch, step, total_step, n_epoch,
                             time.time() - start_time)
                loss = sess.run(cost, feed_dict=feed_dict)
                acc = sess.run(accuracy, feed_dict=feed_dict)
                logging.info(
                    "Minibatch Loss= " + "{:.6f}".format(loss) + ", Training Accuracy= " + "{:.5f}".format(acc))
                save_checkpoint(sess, ckpt_file)
            step += 1

        # 计算测试集准确率
        test_data = x_test
        test_label = y_test
        # max_seq_len = max([len(d) for d in test_data])
        for i, d in enumerate(test_data):
            test_data[i] = test_data[i][:max_seq_len]
            test_data[i] += [np.zeros(200) for i in range(max_seq_len - len(d))]
        test_data = list(test_data)
        logging.info("Testing Accuracy: %f", sess.run(accuracy, feed_dict={x: test_data, y: test_label}))


def export(model_version, model_dir, sess, x, y_op):
    """导出模型
    """
    if model_version <= 0:
        logging.warning('Please specify a positive value for version number.')
        sys.exit()

    path = os.path.dirname(os.path.abspath(model_dir))
    if os.path.isdir(path) == False:
        logging.warning('Path (%s) not exists, making directories...', path)
        os.makedirs(path)

    export_path = os.path.join(
        compat.as_bytes(model_dir),
        # compat.as_bytes(str(model_version))
    )

    if os.path.isdir(export_path) == True:
        logging.warning('Path (%s) exists, removing directories...', export_path)
        shutil.rmtree(export_path)

    builder = saved_model_builder.SavedModelBuilder(export_path)
    tensor_info_x = utils.build_tensor_info(x)
    tensor_info_y = utils.build_tensor_info(y_op)

    prediction_signature = signature_def_utils.build_signature_def(
        inputs={'x': tensor_info_x},
        outputs={'y': tensor_info_y},
        method_name=signature_constants.PREDICT_METHOD_NAME)
    print([tag_constants.SERVING])
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

    ckpt_file = "./cnn_checkpoint/cnn.ckpt"
    max_seq_len = 20
    x = tf.placeholder("float", [None, max_seq_len, 200], name="inputs")
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
        model_dir = "old/output\cnn_model"
        network = network(x, keep=1.0)
        sess.run(tf.global_variables_initializer())
        load_checkpoint(sess, ckpt_file)
        export(model_version, model_dir, sess, x, network.outputs)
        logging.info("Servable Export Finishied!")
