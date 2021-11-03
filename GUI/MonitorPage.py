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

        index = np.arange(len(data))

        JOY = np.array(data.JOY)
        ANGER = np.array(data.ANGER)
        SADNESS = np.array(data.SADNESS)
        FRIGHT = np.array(data.FRIGHT)
        FEAR = np.array(data.FEAR)
        LOVE = np.array(data.LOVE)

        self.figure, axs = plt.subplots(1, 2, figsize=(7, 4))
        axs[0].bar(index, JOY, width=0.4, label='JOY')
        axs[0].bar(index, ANGER, width=0.4, bottom=JOY, label='ANGER')
        axs[0].bar(index, SADNESS, width=0.4, bottom=ANGER + JOY, label='SADNESS')
        axs[0].bar(index, FRIGHT, width=0.4, bottom=ANGER + JOY + SADNESS, label='FRIGHT')
        axs[0].bar(index, FEAR, width=0.4, bottom=ANGER + JOY + SADNESS + FRIGHT, label='FEAR')
        axs[0].bar(index, LOVE, width=0.4, bottom=ANGER + JOY + SADNESS + FRIGHT + FEAR, label='LOVE')

        axs[0].set_ylim(0, 50)
        axs[0].set_xticklabels(Date, rotation=90)
        axs[0].legend(loc='upper left', shadow=True)

        summ = JOY + ANGER + SADNESS + FRIGHT + FEAR + LOVE
        percentage1 = JOY / summ
        percentage2 = ANGER / summ
        percentage3 = SADNESS / summ
        percentage4 = FRIGHT / summ
        percentage5 = FEAR / summ
        percentage6 = LOVE / summ

        axs[1].bar(index, percentage1, width=0.4, label=JOY)
        axs[1].bar(index, percentage2, width=0.4, bottom=percentage1, label=ANGER)
        axs[1].bar(index, percentage3, width=0.4, bottom=percentage1 + percentage2, label=SADNESS)
        axs[1].bar(index, percentage4, width=0.4, bottom=percentage1 + percentage2 + percentage3, label=FRIGHT)
        axs[1].bar(index, percentage5, width=0.4, bottom=percentage1 + percentage2 + percentage3 + percentage4,
                   label=FEAR)
        axs[1].bar(index, percentage6, width=0.4,
                   bottom=percentage1 + percentage2 + percentage3 + percentage4 + percentage5, label=LOVE)

        axs[1].set_ylim(0, 1)
        axs[1].set_xticklabels(Date, rotation=90)