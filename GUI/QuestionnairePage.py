import tkinter as tk
from tkinter import ttk


class QuestionnairePage(tk.Frame):
    def __init__(self, parent, root):
        super().__init__(parent)
        self.root = root

        info_frame = self.create_info_frame()
        info_frame.grid(column=0, row=0)

        page_frame = self.create_page_frame()
        page_frame.grid(column=0, row=1)

        button_frame = self.create_button_frame()
        button_frame.grid(column=0, row=2)

    def create_info_frame(self):
        info_frame = ttk.Frame(self, height=350, width=500)
        info_frame['relief'] = "groove"
        info_frame['padding'] = 20
        info_frame.columnconfigure(index=0, weight=1)
        info_frame.columnconfigure(index=1, weight=2)
        # Test label
        label1 = ttk.Label(info_frame, text="Username: ")
        label1.grid(row=0, column=0, sticky=tk.W, padx=2, pady=2)

        label2 = ttk.Label(info_frame, text="zzkzzzzz")
        label2.grid(row=0, column=1, sticky=tk.E, padx=2, pady=2)

        label3 = ttk.Label(info_frame, text="Gender: ")
        label3.grid(row=1, column=0, sticky=tk.W, padx=2, pady=2)

        label3 = ttk.Label(info_frame, text="Male")
        label3.grid(row=1, column=1, sticky=tk.E, padx=2, pady=2)

        return info_frame

    def create_page_frame(self):
        cursor = self.root.database.cursor()
        sql = "SELECT * FROM emotion_info"
        try:
            # 执行SQL语句
            cursor.execute(sql)
            # 获取所有记录列表
            results = cursor.fetchall()
        except:
            results = 'Error'
            print("Error: unable to fetch data")

        page_frame = ttk.Frame(self, height=350, width=500)
        label1 = ttk.Label(page_frame, text="这里是questionnaire")
        label1.grid(row=0, column=0, sticky=tk.W, padx=2, pady=2)

        return page_frame

    def create_button_frame(self):
        button_frame = ttk.Frame(self, height=150, width=500)
        button_frame['padding'] = 5
        button_frame.columnconfigure(0, weight=1)
        button_frame.columnconfigure(1, weight=1)
        button_frame.columnconfigure(2, weight=1)

        # navigator button to Questionnaire
        questionnaire_button = ttk.Button(button_frame,
                                          style='Button_ON.TButton',
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
                                    style='Button_OFF.TButton',
                                    text="Long-term Monitoring",
                                    command=lambda: self.root.show_page('MonitorPage'))
        monitor_button.grid(column=2, row=0, sticky=tk.W, padx=2, pady=2)

        return button_frame
