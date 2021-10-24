#! /usr/bin/env python3
"""生成用于NBOW+MLP Classifier的训练集。

训练好词向量后，通过将词向量线性相加获得文本的向量。
输入分词后的样本，每一行逐词查找词向量并相加，从而得到文本的特征向量和标签。
分别将正负样本保存到sample_pass.npz和sample_spam.npz。

"""

import numpy as np
import tensorlayer as tl


wv = tl.files.load_npy_to_any(name='../data/output/model_word2vec_200.npy')

embeddings = []
inp_text = "../data/ijcnlp_dailydialog/dialogues_text.txt"
inp_label = "../data/ijcnlp_dailydialog/dialogues_emotion.txt"
outp = "../data/output/sample_seq"
f_text = open(inp_text, encoding='utf-8')
f_label = open(inp_label, encoding='utf-8')
text_num = []
label_num = []
for dialogue in f_text:
    lines = dialogue.split('__eou__')
    text_num.append(len(lines))
    for line in lines:
        if line == '\n':
            continue
        words = line.strip().split(' ')
        text_sequence = []
        for word in words:
            try:
                text_sequence.append(wv[word])
            except KeyError:
                text_sequence.append(wv['UNK'])
        embeddings.append(text_sequence)

# embeddings = np.asarray(embeddings, dtype=np.float32)

labels = []
for dialogue in f_label:
    lines = dialogue.split(' ')
    label_num.append(len(lines))
    for line in lines:
        if line == '\n':
            continue
        labels.append(line)


labels = np.asarray(labels, dtype=np.int32)

np.savez(outp, x=embeddings, y=labels)


f_text.close()
f_label.close()
