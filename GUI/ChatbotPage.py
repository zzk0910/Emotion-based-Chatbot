import datetime
import tkinter as tk
from tkinter import messagebox, scrolledtext
from tkinter import ttk
from Generation.generation import load_generation_model, gen
import random
import json
import tensorflow as tf
import requests


class ChatbotPage(tk.Frame):
    def __init__(self, parent, root):
        super().__init__(parent)
        self.root = root
        self.emotion_recognition_url = 'http://127.0.0.1:8000/emotion_recognition'
        self.config = {
            "window": "900x600",
            "message": {
                "font": ["calibri", 14],
                "font_color": "balck",
                "bd": 4,
                "bg": "white"
            },
            "question": {
                "font": ["calibri", 14],
                "font_color": "balck",
                "bd": 4,
                "bg": "white"
            },
            "button": {
                "font": ["calibri", 14],
                "font_color": "black",
                "bd": 4,
                "bg": "white"
            },
            "generation_nodel_dir": "../Generation/checkpoint",
            "emotion_classification_dir": ""

        }
        self.rowconfigure(0, weight=6)
        self.rowconfigure(1, weight=1)
        self.columnconfigure(0, weight=3)
        self.columnconfigure(1, weight=1)

        self.model_name = "level400"
        self.sess2 = load_generation_model(model_name=self.model_name)    # Start gpt-2 model

        chat_frame = self.create_chat_frame()
        chat_frame.grid(row=0, column=0, sticky="nsew")

        button_frame = self.create_button_frame()
        button_frame.grid(row=1, column=0, columnspan=2)

    def create_chat_frame(self):
        chat_frame = ttk.Frame(self)

        chat_frame.rowconfigure(0, weight=2)
        chat_frame.rowconfigure(1, weight=1)
        chat_frame.columnconfigure(0, weight=2)
        chat_frame.columnconfigure(1, weight=1)

        # chat_frame['padding'] = 5

        textShow = scrolledtext.ScrolledText(chat_frame,
                                             bd=self.config["message"]["bd"],
                                             font=self.config["message"]["font"])
        textShow.grid(row=0, column=0, columnspan=2, sticky="nsew")

        textInput = tk.Entry(
            chat_frame,
            bd=self.config["question"]["bd"],
            font=self.config["question"]["font"])
        textInput.grid(row=1, column=0, sticky="ew")
        textShow.tag_add("user", tk.END)
        textShow.tag_add("littlegenesis", tk.END)
        textShow.tag_add("input_sentence", tk.END)
        textShow.tag_config("user", foreground="blue", font=self.config["message"]["font"])
        textShow.tag_config("littlegenesis", foreground="green", font=self.config["message"]["font"])
        textShow.tag_config("input_sentence", foreground="green", font=self.config["message"]["font"])

        # Welcome notes
        textShow.config(state='normal')
        textShow.insert(tk.END, "Hi ! I'm little genius, nice to meet you! \n" +
                        "Just share me anything you want to say. I'm excited to listen to your story! \n\n")
        textShow.see(tk.END)
        textShow.config(state='disabled')

        with open("../Generation/rules.json", 'r') as f:
            responses = json.load(f)
            fix_response = responses["daily"]
            emotion_response = responses["emotions"]
            topics = responses["topics"]
        emotion_threshold = {
            "high": {
                0: ["anger", 0.3],  # anger
                1: ["disgust", 0.3],  # disgust
                2: ["fear", 0.3],  # fear
                3: ["joy", 0.3],  # joy
                4: ["sadness", 0.3],  # sad
                5: ["surprise", 0.3]  # surprise
            },
            "middle": {
                0: ["anger", 0.6],  # anger
                1: ["disgust", 0.6],  # disgust
                2: ["fear", 0.6],  # fear
                3: ["joy", 0.6],  # joy
                4: ["sadness", 0.6],  # sad
                5: ["surprise", 0.6]  # surprise
            },
            "low": {
                0: ["anger", 0.75],  # anger
                1: ["disgust", 0.75],  # disgust
                2: ["fear", 0.75],  # fear
                3: ["joy", 0.75],  # joy
                4: ["sadness", 0.75],  # sad
                5: ["surprise", 0.75]  # surprise
            }
        }

        def response_strategy(f_reponse, e_response, input_sentence, emotion_threshold):
            if str.lower(input_sentence) in f_reponse:
                answer = random.choice(f_reponse[str.lower(input_sentence)])
                return answer
            else:
                data = {'text': input_sentence}  # 请求的参数，或者说是要传输的数据
                result_ER = requests.post(self.emotion_recognition_url, json=data)
                result_ER = json.loads(result_ER.text)
                label, value = result_ER['index'], result_ER['val']
                # label, value = 3, 0.3
                # update database
                current_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                sql = "INSERT INTO emotion_info" \
                      "(emotion_type, emotion_value,time,user_text,user_name)" \
                      "VALUES (%d, %f, '%s', '%s','%s')" % \
                      (label, value, current_time, input_sentence,self.root.username)
                with self.root.database.cursor() as cursor:
                    try:
                        cursor.execute(sql)
                        self.root.database.commit()
                    except:
                        self.root.database.rollback()
                        print("database insert error: Chatbot")
                # end update database

                for k in topics.keys():
                    if k in input_sentence:
                        prefix = random.choice(topics[k])
                        answer = gen(self.sess2, prefix, self.model_name, include_prefix=True) + "."
                        return answer

                # Use questionnaire score to adjust response strategy
                que_score = 50
                cursor = self.root.database.cursor()
                sql = "SELECT `GAD-7_Score`, `PHQ-9_Score`, `PSS`, `ISI` FROM questionnaire " \
                      "where user_name = '%s' order by time desc limit 1" \
                      % self.root.username

                try:
                    cursor.execute(sql)
                    inquire_results = cursor.fetchall()
                    if len(inquire_results) > 0:
                        inquire_results = inquire_results[0]
                        que_score = sum(inquire_results)
                except:
                    # inquire_results = 'Error'
                    print("Error: unable to fetch data")

                if que_score >= 87:
                    threshold = emotion_threshold["high"]
                elif 34 < que_score < 87:
                    threshold = emotion_threshold["middle"]
                else:
                    threshold = emotion_threshold["low"]

                if value >= threshold[label][1]:
                    e_type = threshold[label][0]
                    prefix = random.choice(e_response[e_type])
                    answer = gen(self.sess2, prefix, self.model_name, include_prefix=True) + "."
                    return answer
                else:
                    answer = gen(self.sess2, input_sentence,self.model_name, include_prefix=False) + "."
                    return answer

        def send_message():
            q = textInput.get()
            # textInput.delete(0, tk.END)
            if q.replace(" ", "") == "":
                # messagebox.showwarning('Warning', "Empty Message！")
                return

            textShow.config(state='normal')
            textShow.insert(tk.END, "User：\n", "user")
            textShow.insert(tk.END, q, "user")
            textShow.insert(tk.END, "\n\n", "user")
            textShow.see(tk.END)
            textShow.config(state='disabled')

        def give_response():
            q = textInput.get()
            textInput.delete(0, tk.END)
            if q.replace(" ", "") == "":
                messagebox.showwarning('Warning', "Empty Message！")
                return

            textShow.config(state='normal')
            textShow.insert(tk.END, "Little Genesis：\n", "littlegenesis")
            textShow.insert(tk.END,
                            response_strategy(fix_response, emotion_response, q, emotion_threshold),
                            "input_sentence")
            textShow.insert(tk.END, "\n\n", "littlegenesis")
            textShow.see(tk.END)
            textShow.config(state='disabled')

        # def button_action():
        # q = textInput.get()
        # textInput.delete(0, tk.END)
        # if q.replace(" ", "") == "":
        #     messagebox.showwarning('Warning', "Empty Message！")
        #     return
        # send_message(q)
        # give_response(q)

        send = ttk.Button(chat_frame,
                          text='SEND',
                          command=lambda: [send_message(), give_response()])
        send.grid(row=1, column=1, sticky="ew")

        return chat_frame

    def create_button_frame(self):
        button_frame = ttk.Frame(self)
        button_frame['padding'] = 5
        button_frame.columnconfigure(0, weight=1)
        button_frame.columnconfigure(1, weight=1)
        button_frame.columnconfigure(2, weight=1)

        # navigator button to Questionnaire
        questionnaire_button = ttk.Button(button_frame,
                                          style='Button_OFF.TButton',
                                          text="Questionnaire",
                                          command=lambda: self.root.show_page('QuestionnairePage'))
        questionnaire_button.grid(column=0, row=0, sticky='ew', padx=2, pady=2)

        # navigator button to Chatroom
        chatbot_button = ttk.Button(button_frame,
                                    style='Button_ON.TButton',
                                    text="Little Genius",
                                    command=lambda: self.root.show_page('ChatbotPage'))
        chatbot_button.grid(column=1, row=0, sticky='ew', padx=2, pady=2)
        # navigator button to Monitor
        monitor_button = ttk.Button(button_frame,
                                    style='Button_OFF.TButton',
                                    text="Long-term Monitoring",
                                    command=lambda: self.root.show_page('MonitorPage'))
        monitor_button.grid(column=2, row=0, sticky='ew', padx=2, pady=2)

        return button_frame

#
# if __name__ == "__main__":
#     ChatbotPage()
