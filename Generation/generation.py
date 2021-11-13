import os
import sys
import json
import time
import random
import gpt_2_simple as gpt2
import tensorflow as tf

# ------------------- 使用GPT-2模型进行语言生成 ---------------------------


def load_generation_model(model_name="level1000"):
    checkpoint_dir = "../Generation/checkpoint"
    sess = gpt2.start_tf_sess()
    gpt2.load_gpt2(sess, run_name=model_name, checkpoint_dir=checkpoint_dir)

    return sess


def gen(sess, prefix, model_name, include_prefix):
    checkpoint_dir = "../Generation/checkpoint"
    if include_prefix:
        answers = gpt2.generate(sess=sess,
                                run_name=model_name,
                                checkpoint_dir=checkpoint_dir,
                                length=30,
                                temperature=0.7,
                                seed=random.randint(1, 1000),
                                prefix=prefix,
                                nsamples=5,
                                top_k=10,
                                top_p=0.9,
                                include_prefix=True,
                                truncate='.\n',
                                return_as_list=True,
                                batch_size=5)
    else:
        answers = gpt2.generate(sess=sess,
                                run_name=model_name,
                                checkpoint_dir=checkpoint_dir,
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

    # print(answers[random.randint(0, 4)])

    return answers[0]


if __name__ == "__main__":
    sess = load_generation_model(model_name="level1000")
    answer = gen(sess, prefix="I have a good time.", model_name="level1000", include_prefix=False)
    # print(answer)