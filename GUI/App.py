import tkinter as tk
from tkinter import ttk
from tkinter.messagebox import showinfo, showerror, showwarning
from MainMenu import MainMenu


class App(tk.Tk):
    def __init__(self):
        super().__init__()
        self.create_window()
        self.create_widgets()

    def create_window(self):
        sw = tk.Tk.winfo_screenwidth(self)
        sh = tk.Tk.winfo_screenheight(self)
        width = 300
        height = 150
        center_str= '%dx%d+%d+%d' % (width, height, (sw - width) / 2, (sh - height) / 4)
        # Set title
        self.title('Login')
        # Set the size of the window
        self.geometry(center_str)  # width x height ± x ± y

        # configure the grid
        self.columnconfigure(1, weight=1)
        self.columnconfigure(2, weight=2)
        self.rowconfigure(1, weight=1)
        self.rowconfigure(2, weight=2)
        self.rowconfigure(3, weight=1)

    def create_widgets(self):
        # Welcome tag
        welcome_label = ttk.Label(self, text="Welcome to Little Genesis chat system!")
        welcome_label.grid(column=1, row=1, columnspan=2, padx=5, pady=5)

        # username label
        username_label = ttk.Label(self, text="Username:")
        username_label.grid(column=1, row=2, sticky=tk.W, padx=2, pady=2)

        # username
        username = tk.StringVar()
        username_entry = ttk.Entry(self, textvariable=username, background='white')
        username_entry.grid(column=2, row=2, ipady=5)
        username_entry.focus()

        def buttoncallback():
            showinfo("Message", message="'%s' Logged in successfully! " % username_entry.get())
            user_name = username_entry.get()
            print(user_name)
            self.destroy()
            # Create MainMenu
            m = MainMenu(user_name)
            m.mainloop()

        # login button
        login_button = ttk.Button(self,
                                  text="Login",
                                  command=buttoncallback
                                  )
        login_button.grid(column=1, row=3, columnspan=2, padx=5, pady=5)




if __name__ == "__main__":
    app = App()
    app.mainloop()
