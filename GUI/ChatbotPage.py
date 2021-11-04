import tkinter as tk
from tkinter import messagebox, scrolledtext
from tkinter import ttk
from EmotionRecognition.serving.predict import run_api
from Generation.generation import load_generation_model, gen
import random
import PIL
from PIL import Image
from PIL import ImageTk
import json
import tensorflow as tf


class ChatbotPage(tk.Frame):
    def __init__(self, parent, root):
        super().__init__(parent)
        self.root = root
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

        # self.sess2 = load_generation_model()    # Start gpt-2 model

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
        textShow.insert(tk.END, "Hi ! I'm little Genesis, nice to meet you! \n" +
                               "Just share me anything you want to say. I'm excited to liten to your story! \n\n")
        textShow.see(tk.END)
        textShow.config(state='disabled')

        with open("../Generation/rules.json", 'r') as f:
            responses = json.load(f)
            fix_response = responses["daily"]
            emotion_response = responses["emotions"]
        emotion_threshold = {
            1: ["sadness", 0.6],  # sad
            2: ["fear", 0.6],  # fear
            3: ["anger", 0.6],  # anger
            4: ["joy", 0.6],  # joy
            5: ["disgust", 0.6],  # disgust
            6: ["surprise", 0.6]  # surprise
        }

        def response_strategy(f_reponse, e_response, input_sentence, emotion_threshold):
            if input_sentence in f_reponse:
                answer = random.choice(f_reponse[input_sentence])
            else:
                label, value = run_api(input_sentence)
                # label, value = 3, 0.3

                tf.compat.v1.reset_default_graph()
                sess2 = load_generation_model()
                if value >= emotion_threshold[label][1]:
                    e_type = emotion_threshold[label][0]
                    prefix = random.choice(e_response[e_type])
                    answer = gen(sess2, prefix, include_prefix=True)
                else:
                    answer = gen(sess2, input_sentence, include_prefix=False)
                sess2.close()

            return answer

        def send_message():
            q = textInput.get()
            # textInput.delete(0, tk.END)
            if q.replace(" ", "") == "":
                # messagebox.showwarning('Warning', "Empty Message！")
                return

            # 存储需要的东西到数据库 sentence就是q
            """
            
            
            """

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
                            response_strategy(fix_response, emotion_response, q, emotion_threshold) + ".",
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
                                    text="Little Genesis",
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