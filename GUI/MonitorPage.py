import tkinter as tk
from tkinter import ttk
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg, NavigationToolbar2Tk
import pandas as pd

class MonitorPage(tk.Frame):
    def __init__(self, parent, root):
        super().__init__(parent)
        self.root = root
        self.rowconfigure(index=0, minsize=550)
        self.rowconfigure(index=1, minsize=150)

        page_frame = self.create_page_frame()
        page_frame.grid(column=0, row=0,sticky='ns')

        button_frame = self.create_button_frame()
        button_frame.grid(column=0, row=1, sticky='ns')



    def create_page_frame(self):
        page_frame = ttk.Frame(self, height=550, width=700)
        self.create_matplotlib()
        self.label = tk.Label(page_frame, text='Long-term Monitor of wulalabulala')
        self.label.pack()
        # 创建画布
        self.canvas = FigureCanvasTkAgg(self.figure, page_frame)
        self.canvas.draw()
        self.canvas.get_tk_widget().pack(side=tk.BOTTOM, fill=tk.BOTH, expand=1)

        return page_frame

    def create_button_frame(self):
        button_frame = ttk.Frame(self, height=150, width=500)
        button_frame['padding'] = 5
        button_frame.columnconfigure(0, weight=1)
        button_frame.columnconfigure(1, weight=1)
        button_frame.columnconfigure(2, weight=1)

        # navigator button to Questionnaire
        questionnaire_button = ttk.Button(button_frame,
                                          style='Button_OFF.TButton',
                                          text="Questionnaire",
                                          command=lambda: self.root.show_page('QuestionnairePage'))
        questionnaire_button.grid(column=0, row=0, sticky=tk.W, padx=2, pady=2)

        # navigator button to Chatroom
        chatbot_button = ttk.Button(button_frame,
                                    style='Button_OFF.TButton',
                                    text="Little Genesis",
                                    command=lambda: self.root.show_page('ChatbotPage'))
        chatbot_button.grid(column=1, row=0, sticky=tk.W, padx=2, pady=2)

        # navigator button to Monitor
        monitor_button = ttk.Button(button_frame,
                                    style='Button_ON.TButton',
                                    text="Long-term Monitoring",
                                    command=lambda: self.root.show_page('MonitorPage'))
        monitor_button.grid(column=2, row=0, sticky=tk.W, padx=2, pady=2)

        return button_frame

    
    def create_matplotlib(self):
         data = pd.read_csv("emotion2.csv")
         Date = data.DATE

         JOY = np.array(data.JOY)
         ANGER = np.array(data.ANGER)
         SADNESS = np.array(data.SADNESS)
         FRIGHT = np.array(data.FRIGHT)
         FEAR = np.array(data.FEAR)
         LOVE = np.array(data.LOVE)
         self.figure = plt.figure(num=2, figsize=(7, 7), dpi=80, facecolor="white", edgecolor='green', frameon=True)
         # self.figure.text(0.45, 0.94, 'wulalabulala')

         plt.bar(range(len(JOY)), JOY, label='Joy', facecolor='darkorange', width=0.8)
         plt.bar(range(len(JOY)), ANGER, bottom=JOY, label='Anger', facecolor='gray', width=0.8)
         plt.bar(range(len(JOY)), SADNESS, bottom=JOY+ANGER, label='Sadness', facecolor='blue', width=0.8)
         plt.bar(range(len(JOY)), FRIGHT, bottom=JOY+ANGER+SADNESS, label='Fright', facecolor='yellowgreen', width=0.8)
         plt.bar(range(len(JOY)), FEAR, bottom=JOY+ANGER+SADNESS+FRIGHT, label='Fear', facecolor='orchid', width=0.8)
         plt.bar(range(len(JOY)), LOVE, bottom=JOY+ANGER+SADNESS+FRIGHT+FEAR, label='Love',facecolor='pink', width=0.8)

         plt.legend(loc=2) 

