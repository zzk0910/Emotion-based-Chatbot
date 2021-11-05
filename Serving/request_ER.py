import time
import requests
import json

a = time.time()
data = {'text': 'How are you doing？'} # 请求的参数，或者说是要传输的数据

url = 'http://120.78.11.2:8000/emotion_recognition'      # 远程服务
# url = 'http://127.0.0.1:8000/emotion_recognition'      # 本地服务


r = requests.post(url, json = data)  # 用post请求


result = json.loads(r.text)
print(result)
b = time.time()

print('运行时间:', b-a)