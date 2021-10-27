import tkinter as tk
from tkinter import ttk
from ChatbotPage import ChatbotPage
from QuestionnairePage import QuestionnairePage
from MonitorPage import MonitorPage


class MainMenu(tk.Tk):

    def __init__(self):
        super().__init__()
        self._init_ttk_style()
        self._create_window()

        # if add page, please change this dict
        self._pages_name_obj = {'ChatbotPage': ChatbotPage,
                                'QuestionnairePage': QuestionnairePage,
                                'MonitorPage': MonitorPage}
        self.pages = self._register_pages()

        # show first page
        self.show_page('ChatbotPage')

    def _init_ttk_style(self):
        self.ttk_style = ttk.Style()
        self.ttk_style.configure("Button_ON.TButton", background="blue", borderwidth=100)
        self.ttk_style.configure("Button_OFF.TButton", background="white")

    def _create_window(self):
        sw = tk.Tk.winfo_screenwidth(self)
        sh = tk.Tk.winfo_screenheight(self)
        width = 500
        height = 400
        center_str = '%dx%d+%d+%d' % (width, height, (sw - width) / 2, (sh - height) / 4)
        # Set title
        self.title('Login')
        # Set the size of the window
        self.geometry(center_str)  # width x height ± x ± y

    def _create_container(self):
        container = tk.Frame(self)
        container.pack(side="top", fill="both", expand=True)
        container.grid_rowconfigure(0, weight=1)
        container.grid_columnconfigure(0, weight=1)
        return container

    def _register_pages(self):
        pages = {}
        container = self._create_container()
        for page_name, page_obj in self._pages_name_obj.items():
            page = page_obj(container, self)
            pages[page_name] = page
            page.grid(row=0, column=0, sticky="nsew")
        return pages

    def show_page(self, frame_name):
        page = self.pages[frame_name]
        page.tkraise()


if __name__ == "__main__":
    page = MainMenu()
    page.mainloop()
