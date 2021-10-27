import tkinter as tk
from tkinter import ttk


class MainMenu(tk.Tk):
    def __init__(self):
        super().__init__()

        self.create_window()

        info_frame = self.create_info_frame()
        info_frame.grid(column=0, row=0)

        button_frame = self.create_button_frame()
        button_frame.grid(column=0, row=1)

    def create_window(self):
        sw = tk.Tk.winfo_screenwidth(self)
        sh = tk.Tk.winfo_screenheight(self)
        width = 500
        height = 400
        center_str= '%dx%d+%d+%d' % (width, height, (sw - width) / 2, (sh - height) / 4)
        # Set title
        self.title('Login')
        # Set the size of the window
        self.geometry(center_str)  # width x height ± x ± y

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

    def create_button_frame(self):
        button_frame = ttk.Frame(self, height=150, width=500)
        button_frame['padding'] = 5
        button_frame.columnconfigure(0, weight=1)
        button_frame.columnconfigure(1, weight=1)
        button_frame.columnconfigure(2, weight=1)

        # navigator button to Questionnaire
        login_button = ttk.Button(button_frame, text="Questionnaire")
        login_button.grid(column=0, row=0, sticky=tk.W, padx=2, pady=2)

        # navigator button to Chatroom
        login_button = ttk.Button(button_frame, text="Little Genesis")
        login_button.grid(column=1, row=0, sticky=tk.W, padx=2, pady=2)

        # navigator button to Monitor
        login_button = ttk.Button(button_frame, text="Long-term Monitoring")
        login_button.grid(column=2, row=0, sticky=tk.W, padx=2, pady=2)

        return button_frame


if __name__ == "__main__":
    page = MainMenu()
    page.mainloop()