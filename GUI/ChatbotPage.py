import tkinter as tk
from tkinter import messagebox, scrolledtext
from tkinter.colorchooser import askcolor
from tkinter import ttk
from PIL import Image
from PIL import ImageTk
# import gpt_2_simple as gpt2

class ChatbotPage(tk.Frame):
    def __init__(self, parent, root):
        super().__init__(parent)
        self.root = root
        self.config = {
            "window": "900x600",
            "message": {
                "font": ["calibri",14],
                "font_color": "balck",
                "bd": 4,
                "bg": "white"
            },
            "question": {
                "font": ["calibri",14],
                "font_color": "balck",
                "bd": 4,
                "bg": "white"
            },
            "button": {
                "font": ["calibri",14],
                "font_color": "black",
                "bd": 4,
                "bg": "white"
            }
        }
        self.rowconfigure(index=0, weight=6)
        self.rowconfigure(index=1, weight=1)

        chat_frame = self.create_chat_frame()
        chat_frame.grid(column=0, row=0)

        button_frame = self.create_button_frame()
        button_frame.grid(column=0, row=1)

        # @staticmethod
        # def activate_model(checkpoint_dir):
        #     sess = gpt2.start_tf_sess()
        #     gpt2.load_gpt2(sess, run_name="run2", checkpoint_dir=checkpoint_dir, reuse=True)
        #
        #     return sess
        #
        # self.chat_session = activate_model("../Generation/checkpoint")
        #
        # def about():
        #     messagebox.showinfo('关于聊天机器人', '开发者：***\n开发日期：**** 年 ** 月')
        # def helper():
        #     messagebox.showinfo('关于聊天机器人',
        #                         '使用说明：\n1.在底下的发送框输入信息；\n2.点击“发送”按钮发送消息；\n3.聊天机器人回复。\n\n注意事项：\n1.程序不能回车发送\n2.使用时请连接网络\n3.回复个别问题可能出现乱码，请见谅')

    def create_chat_frame(self):
        chat_frame = ttk.Frame(self)
        # chat_frame['padding'] = 5
        chat_frame.columnconfigure(0, weight=4)
        chat_frame.columnconfigure(1, weight=1)
        chat_frame.columnconfigure(2, weight=2)
        chat_frame.rowconfigure(0, weight=3)
        chat_frame.rowconfigure(1, weight=2)
        chat_frame.rowconfigure(2, weight=1)

        textShow = scrolledtext.ScrolledText(chat_frame, bd=self.config["message"]["bd"], font=self.config["message"]["font"])
        textShow.config(state='disabled')
        textShow.grid(column=0, row=0, rowspan=2, columnspan=2, sticky="nsew")

        textInput = tk.Entry(chat_frame, bd=self.config["question"]["bd"], font=self.config["question"]["font"])
        textInput.grid(column=0, row=2, sticky="nsew")

        def chat():
            return "good!"

        def send_message():
            q = textInput.get()
            textInput.delete(0, tk.END)
            if q.replace(" ", "") == "":
                messagebox.showwarning('Warning', "Empty Message！")
                return
            textShow.config(state='normal')
            textShow.insert(tk.END, "User：" + q + "\n")
            textShow.insert(tk.END, "Little Genesis：" + chat() + "\n")
            textShow.see(tk.END)
            textShow.config(state='disabled')

        def show_usr_info():
            tk.Toplevel()

        send = ttk.Button(chat_frame,
                          text='SEND',
                          command=send_message)
        send.grid(column=1, row=2, sticky="nsew")

        # load = Image.open("/Users/zzkzz/Pictures/截图/iShot2021-10-18 16.08.50.png")   # open image from path
        # img = ImageTk.PhotoImage(load)                      # read opened image
        # label1 = tk.Label(chat_frame, image=img)            # create a label to insert this image
        # label1.grid(column=2, row=0, sticky="nsew")

        usr_info = ttk.Button(chat_frame,
                               text='Myinfo',
                               command=show_usr_info)
        usr_info.grid(column=2, row=1, rowspan=2, sticky="nsew")

        return chat_frame

        # menu = Menu(root)
        # root.config(menu=menu)
        # bot = Menu(menu)
        # bot.add_command(label='程序信息', command=about)
        # bot.add_command(label='帮助', command=helper)
        # menu.add_cascade(label='关于', menu=bot)

        # root.mainloop()

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



if __name__ == "__main__":
    ChatbotPage()