import gpt_2_simple as gpt2

# Before running this code, please download gpt-2-simple by "pip install gpt-2-simple"
# For more information, please refer to https://github.com/minimaxir/gpt-2-simple

model_name = "124M"
cur_path = os.getcwd()
if not os.path.isdir(os.path.join(cur_path, "models/124M")):
    print(f"Downloading {model_name} model...")
    gpt2.download_gpt2(model_name=model_name)   # model is saved into current directory under /models/124M/

file_name = os.path.join(cur_path, "trainData/answers_all.txt")


# Fine-tune the model
sess = gpt2.start_tf_sess()
with tf.device('/cpu:0'):
    gpt2.finetune(sess,
                  dataset=file_name,
                  model_name='124M',
                  steps=5,
                  restore_from='fresh',
                  run_name='run_test',
                  print_every=1,
                  sample_every=5,
                  save_every=5
                  )