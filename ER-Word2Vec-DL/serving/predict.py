# coding: utf-8
from __future__ import print_function
from __future__ import division

import tensorflow as tf
import numpy as np
import re


def text2array_rnn(text):
    wv = np.load('../data/output/model_word2vec_200.npy').item()

    text = re.sub(r"([\w/'+$\s-]+|[^\w/'+$\s-]+)\s*", r"\1 ", text)
    words = text.strip().split(' ')
    text_sequence = []
    for word in words:
        try:
            text_sequence.append(wv[word])
        except KeyError:
            text_sequence.append(wv['UNK'])
    vec = np.array(text_sequence)
    vec = vec.reshape(1, -1, 200)
    return vec


def predict(input_vec, model_dir):
    with tf.Session() as sess:
        signature_key = 'predict_text'
        input_key = 'x'
        output_key = 'y'

        meta_graph_def = tf.saved_model.loader.load(sess, ['serve'], model_dir)
        signature = meta_graph_def.signature_def
        x_tensor_name = signature[signature_key].inputs[input_key].name
        y_tensor_name = signature[signature_key].outputs[output_key].name
        x = sess.graph.get_tensor_by_name(x_tensor_name)
        y = sess.graph.get_tensor_by_name(y_tensor_name)
        r = sess.run(y, feed_dict={x: input_vec})
        res = np.exp(r).reshape(-1)
        res = res / np.sum(res)

        index = np.argmax(res)
        val = res[index]

        return index, val


def run_api(input_text):
    model_dir = '../network/old/output/rnn_model/1'
    input_vec = text2array_rnn(input_text)
    index, val = predict(input_vec, model_dir)
    return index, val


if __name__ == '__main__':
    import time
    start_t = time.time()
    print(run_api('What ’ s wrong with that ? Cigarette is the thing I go crazy for .'))
    end_t = time.time()
    print(end_t-start_t)


