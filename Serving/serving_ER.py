from __future__ import print_function
from __future__ import division
from flask import Flask,request
import tensorflow as tf2
import json
import numpy as np
import re
tf = tf2.compat.v1

wv = np.load('../EmotionRecognition/data/output/model_word2vec_200.npy', allow_pickle=True).item()
model_dir = '../EmotionRecognition/network/output/rnn_model/1'

sess = tf.Session()
signature_key = 'predict_text'
input_key = 'x'
output_key = 'y'

meta_graph_def = tf.saved_model.loader.load(sess, ['serve'], model_dir)
signature = meta_graph_def.signature_def
x_tensor_name = signature[signature_key].inputs[input_key].name
y_tensor_name = signature[signature_key].outputs[output_key].name
x = sess.graph.get_tensor_by_name(x_tensor_name)
y = sess.graph.get_tensor_by_name(y_tensor_name)


def text2array_rnn(text):
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


def predict(input_vec):
    r = sess.run(y, feed_dict={x: input_vec})
    res = np.exp(r).reshape(-1)
    res = res / np.sum(res)

    index = np.argmax(res)
    val = res[index]

    return index, val


app = Flask(__name__)


@app.route("/emotion_recognition", methods=['POST'])
def emotion_recognition():
    tmp = request.get_data(as_text=True)  # 得到post的json 转成str
    data = json.loads(tmp)
    input_vec = text2array_rnn(data['text'])

    index, val = predict(input_vec)
    res_dict = {'index': int(index), 'val': float(val)}
    return res_dict


if __name__ == '__main__':
    app.run(host='localhost', port=8000)
