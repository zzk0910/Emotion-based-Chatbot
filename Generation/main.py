import os
import sys
import json
import time
import spacy
import random
import numpy as np
import platform
import gpt_2_simple as gpt2
import tensorflow as tf

import pytextrank
from icecream import ic


# 前期准备工作
# CUR_DIR = os.path.abspath(os.path.dirname(__file__))
# RULE_DIR = os.path.join(CUR_DIR, 'rules.json')
# with open(RULE_DIR, 'r') as f:
#     contents = json.load(f)
#     rules = contents["emotions"]
#     # place_words = contents["place"]
#     # time_words = contents["time"]
#     # f.close()
#
#
# # 用户输入的语句
# text = "I fight with my classmates at university today. He kicked my sister, and I feel pretty angry."

# 情绪识别
###########
###########
###########
###########

#
# # -------------------------- TextRank识别关键字 -----------------------------------------
# # load a spaCy model, depending on language, scale, etc.
# # Before run this line, please use "spacy download en_core_web_sm" to download
# nlp = spacy.load("en_core_web_sm")
#
# # add PyTextRank to the spaCy pipeline
# nlp.add_pipe("textrank")
# doc = nlp(text)
#
# # examine the top-ranked phrases in the document
# for phrase in doc._.phrases[:5]:
#     a = ic(phrase.text)
#     b = ic(phrase.rank, phrase.count)
#     c = ic(phrase.chunks)


# -------------------------- 创建prefix -----------------------------------------
# The format of classification results received: (label, value) e.g. ("sadness", 0.34)

# label, value = ("sadness", 0.34)
# if label == "sadness" and value >= 0.30:
#     prefix = random.choice(rules["sadness"])
# elif label == "fear" and value >= 0.30:
#     prefix = random.choice(rules["fear"])
# else:
#     prefix = None


# -------------------------- 使用GPT-2模型进行语言生成 -----------------------------------------
init_time = time.time()
sess = gpt2.start_tf_sess()
gpt2.load_gpt2(sess, run_name="run2")

st_time = time.time()


prefix = "I have a good day!"
# 因为目前计算一次需要6秒左右，机器人界面能否显示一个“Inputting...”？
print("Inputting...")

answers = gpt2.generate(sess=sess,
                        run_name="run2",
                        length=30,
                        temperature=0.7,
                        seed=random.randint(1, 1000),
                        prefix=prefix,
                        nsamples=5,
                        top_k=10,
                        top_p=0.9,
                        include_prefix=False,
                        truncate='.\n',
                        return_as_list=True,
                        batch_size=5)

print(answers[random.randint(0, 4)])
end_time = time.time()

print("Time Spent on load: %s" % (st_time-init_time))
print("Time Spent on generate: %s" % (end_time-st_time))
