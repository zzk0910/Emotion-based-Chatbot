import tkinter as tk
from tkinter import ttk
import tkinter.messagebox as messagebox


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
        info_frame = ttk.Frame(self, height=200, width=700)

        title_label = tk.Label(info_frame, text="Personal Questionnaire", justify='left', anchor='w',font=("微软雅黑", 14))
        title_label.grid(row=0, column=0, sticky=tk.W)

        return info_frame

    def create_page_frame(self):
        root = self.root
        page_frame = ttk.Frame(self, height=500, width=700)

        canvas = tk.Canvas(page_frame,width=680, height=580, scrollregion=(0, 0, 1000, 6800))
        # scrollbar
        scrollbar = tk.Scrollbar(page_frame, orient=tk.VERTICAL)
        scrollbar.pack(side=tk.RIGHT, fill=tk.Y)

        scrollbar_h = tk.Scrollbar(page_frame, orient=tk.HORIZONTAL)
        scrollbar_h.pack(side=tk.BOTTOM, fill=tk.X)

        # canvas.config(width=300, height=300)
        canvas.config(xscrollcommand=scrollbar_h.set, yscrollcommand=scrollbar.set)
        canvas.pack(side=tk.LEFT, expand=True, fill=tk.BOTH)

        self.canvas = canvas
        frame1 = tk.Frame(canvas, width=700, height=500)

        self.frame1 = frame1
        canvas.create_window(20, 20, window=frame1, anchor='nw')

        scrollbar.config(command=canvas.yview)
        scrollbar_h.config(command=canvas.xview)
        self.info_frame()
        self.scales_frame()

        return page_frame

    def create_button_frame(self):
        button_frame = ttk.Frame(self, height=150, width=700)
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


    def info_frame(self):
        frame1 = self.frame1
        label_part1 = tk.Label(frame1, text='Personal Information', font=("Helvetica", 16, "bold"))
        label_part1.grid(row=1, column=0, sticky=tk.W)
        # Name
        label1 = tk.Label(frame1, text='Name:')
        label1.grid(row=2, column=0, sticky=tk.W)
        self.name = tk.StringVar()
        entryname = tk.Entry(frame1, textvariable=self.name)
        entryname.grid(row=3, column=0, sticky=tk.W)
        # Gender
        label2 = tk.Label(frame1, text='Gender:')
        label2.grid(row=4, column=0, sticky=tk.W)
        # (Radiobutton)
        self.sex = tk.StringVar()
        sex_male = tk.Radiobutton(frame1, text='Male', variable=self.sex, value='Male')
        sex_male.grid(row=5, column=0, sticky=tk.W)
        sex_female = tk.Radiobutton(frame1, text='Female', variable=self.sex, value='Female')
        sex_female.grid(row=6, column=0, sticky=tk.W)
        # Age
        label3 = tk.Label(frame1, text='Age:')
        label3.grid(row=7, column=0, sticky=tk.W)
        # (Radiobutton)
        self.age = tk.IntVar()
        entryAge = tk.Entry(frame1,textvariable=self.age)
        # self.age = str2int(entryAge.get())
        entryAge.grid(row=8, column=0, sticky=tk.W)
        # Occupation
        label4 = tk.Label(frame1, text='Occupation:')
        label4.grid(row=9, column=0, sticky=tk.W)
        # (Radiobutton)
        self.occupation = tk.StringVar()
        entryOcc = tk.Entry(frame1, textvariable=self.occupation)
        entryOcc.grid(row=10, column=0, sticky=tk.W)

    def scales_frame(self):
        frame1 = self.frame1
        canvas = self.canvas
        # Scales
        # GAD-7
        label_part2 = tk.Label(frame1,
                            text='Please answer the questions below', font=("Helvetica", 16, "bold"))
        label_part2.grid(row=11, column=0, sticky=tk.W)

        label5 = tk.Label(frame1,
                       text='GAD-7: Over the last 2 weeks, how often have you been bothered by the following problems?')
        label5.grid(row=12, column=0, sticky=tk.W)
        self.gad = tk.IntVar()
        # q1
        i = 13
        tk.Label(frame1, text="1. Feeling nervous, anxious or on edge？").grid(row=i, column=0, sticky=tk.W)
        i += 1

        v_g1 = tk.IntVar()
        list1 = [("Not at all", 0),
                 ("Several Days", 1),
                 ("More than half days", 2),
                 ("Nearly every day", 3)]
        # Radiobutton(frame1, text="Not at all", variable=v_g1, value=0).grid(row=i, sticky=W)
        # i += 1
        # Radiobutton(frame1, text="Several Days", variable=v_g1, value=1).grid(row=i, sticky=W)
        # i += 1
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_g1, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        print(v_g1.get())
        # self.gad.set(self.gad.get() + v_g1.get())

        # q2
        tk.Label(frame1, text="2. Not being able to stop or control worrying").grid(row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Not at all", 0),
                 ("Several Days", 1),
                 ("More than half days", 2),
                 ("Nearly every day", 3)]
        v_g2 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_g2, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        # self.gad.set(self.gad.get() + score)
        # q3
        tk.Label(frame1, text="3. Worrying too much about different things").grid(row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Not at all", 0),
                 ("Several Days", 1),
                 ("More than half days", 2),
                 ("Nearly every day", 3)]
        v_g3 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_g3, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        # self.gad.set(self.gad.get() + score)
        # q4
        tk.Label(frame1, text="4. Trouble relaxing").grid(row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Not at all", 0),
                 ("Several Days", 1),
                 ("More than half days", 2),
                 ("Nearly every day", 3)]
        v_g4 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_g4, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        # self.gad.set(self.gad.get() + score)
        # q5
        tk.Label(frame1, text="5. Being so restless that it is hard to sit still").grid(row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Not at all", 0),
                 ("Several Days", 1),
                 ("More than half days", 2),
                 ("Nearly every day", 3)]
        v_g5 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_g5, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        # self.gad.set(self.gad.get() + score)
        # q6
        tk.Label(frame1, text="6. Becoming easily annoyed or irritable").grid(row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Not at all", 0),
                 ("Several Days", 1),
                 ("More than half days", 2),
                 ("Nearly every day", 3)]
        v_g6 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_g6, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        # self.gad.set(self.gad.get() + score)
        # q7
        tk.Label(frame1, text="7. feeling afraid as if something awful might happen").grid(row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Not at all", 0),
                 ("Several Days", 1),
                 ("More than half days", 2),
                 ("Nearly every day", 3)]
        v_g7 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_g7, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        # self.gad.set(self.gad.get() + score)
        self.gad.set(v_g1.get() + v_g2.get()+ v_g3.get()+ v_g4.get()+ v_g5.get()+ v_g6.get() +v_g7.get())

        # PHQ-9
        label6 = tk.Label(frame1,
                       text='\nPHQ-9: Over the last 2 weeks, how often have you been bothered by the following problems?')
        label6.grid(row=i, column=0, sticky=tk.W)
        self.phq = tk.IntVar()
        i += 1
        # q1
        tk.Label(frame1, text="1. Little interest or pleasure in doing things?").grid(row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Not at all", 0),
                 ("Several Days", 1),
                 ("More than half days", 2),
                 ("Nearly every day", 3)]
        v_p1 = tk.IntVar()

        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_p1, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.phq.set(self.phq.get() + v_p1.get())
        # q2
        tk.Label(frame1, text="2. Feeling down, depressed, or hopeless").grid(row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Not at all", 0),
                 ("Several Days", 1),
                 ("More than half days", 2),
                 ("Nearly every day", 3)]
        v_p2 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_p2, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.phq.set(self.phq.get() + v_p2.get())
        # q3
        tk.Label(frame1, text="3. Trouble falling or staying asleep, or sleeping too much").grid(row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Not at all", 0),
                 ("Several Days", 1),
                 ("More than half days", 2),
                 ("Nearly every day", 3)]
        v_p3 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_p3, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.phq.set(self.phq.get() + v_p3.get())
        # q4
        tk.Label(frame1, text="4. Feeling tired or having little energy.").grid(row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Not at all", 0),
                 ("Several Days", 1),
                 ("More than half days", 2),
                 ("Nearly every day", 3)]
        v_p4 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_p4, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.phq.set(self.phq.get() + v_p4.get())
        # q5
        tk.Label(frame1, text="5. Poor appetite or overeating.").grid(row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Not at all", 0),
                 ("Several Days", 1),
                 ("More than half days", 2),
                 ("Nearly every day", 3)]
        v_p5 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_p5, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.phq.set(self.phq.get() + v_p5.get())
        # q6
        tk.Label(frame1, text="6. Feeling bad about yourself — or that you are a failure or have let yourself or your "
                           "family down.").grid(row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Not at all", 0),
                 ("Several Days", 1),
                 ("More than half days", 2),
                 ("Nearly every day", 3)]
        v_p6 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_p6, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.phq.set(self.phq.get() + v_p6.get())
        # q7
        tk.Label(frame1, text="7. Trouble concentrating on things, such as studying or entertaining").grid(row=i, column=0,
                                                                                                        sticky=tk.W)
        i += 1
        list1 = [("Not at all", 0),
                 ("Several Days", 1),
                 ("More than half days", 2),
                 ("Nearly every day", 3)]
        v_p7 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_p7, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.phq.set(self.phq.get() + v_p7.get())
        # q8
        tk.Label(frame1, text="8. Moving or speaking so slowly that other people could have noticed?\nOr the opposite — "
                           "being so fidgety or restless that you have been moving around a lot more than "
                           "usual.",width=700, justify='left',anchor='w').grid(row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Not at all", 0),
                 ("Several Days", 1),
                 ("More than half days", 2),
                 ("Nearly every day", 3)]
        v_p8 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_p8, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.phq.set(self.phq.get() + v_p8.get())
        # q9
        tk.Label(frame1, text="9. Thoughts that you would be better off dead or of hurting yourself in some way.").grid(
            row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Not at all", 0),
                 ("Several Days", 1),
                 ("More than half days", 2),
                 ("Nearly every day", 3)]
        v_p9 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_p9, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.phq.set(self.phq.get() + v_p9.get())

        # PSS
        label7 = tk.Label(frame1,
                       text='\nPSS: Over the last month, how often have you been bothered by the following problems?')
        label7.grid(row=i, column=0, sticky=tk.W)
        self.pss = tk.IntVar()
        i += 1
        # q1
        tk.Label(frame1, text="1. How often have you been upset because of something that happened unexpectedly?").grid(
            row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Never", 0),
                 ("Almost Never", 1),
                 ("Sometimes", 2),
                 ("Nearly often", 3),
                 ("Often", 4)]
        v_ps1 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_ps1, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.pss.set(self.pss.get() + v_ps1.get())
        # q2
        tk.Label(frame1, text="2. How often have you felt that you were unable to control the important things in your "
                           "life?").grid(
            row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Never", 0),
                 ("Almost Never", 1),
                 ("Sometimes", 2),
                 ("Nearly often", 3),
                 ("Often", 4)]
        v_ps2 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_ps2, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.pss.set(self.pss.get() + v_ps2.get())
        # q3
        tk.Label(frame1, text="3. How often have you felt nervous and “stressed”?").grid(row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Never", 0),
                 ("Almost Never", 1),
                 ("Sometimes", 2),
                 ("Nearly often", 3),
                 ("Often", 4)]
        v_ps3 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_ps3, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.pss.set(self.pss.get() + v_ps3.get())
        # q4
        tk.Label(frame1,
              text="4. How often have you felt confident about your ability to handle your personal problems?").grid(
            row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Never", 4),
                 ("Almost Never", 3),
                 ("Sometimes", 2),
                 ("Nearly often", 1),
                 ("Often", 0)]
        v_ps4 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_ps4, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.pss.set(self.pss.get() + v_ps4.get())
        # q5
        tk.Label(frame1, text="5. How often have you felt that things were going your way?").grid(row=i, column=0,
                                                                                               sticky=tk.W)
        i += 1
        list1 = [("Never", 4),
                 ("Almost Never", 3),
                 ("Sometimes", 2),
                 ("Nearly often", 1),
                 ("Often", 0)]
        v_ps5 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_ps5, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.pss.set(self.pss.get() + v_ps5.get())
        # q6
        tk.Label(frame1,
              text="6. How often have you found that you could not cope with all the things that you had to do?").grid(
            row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Never", 0),
                 ("Almost Never", 1),
                 ("Sometimes", 2),
                 ("Nearly often", 3),
                 ("Often", 4)]
        v_ps6 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_ps6, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.pss.set(self.pss.get() + v_ps6.get())
        # q7
        tk.Label(frame1, text="7. How often have you been able to control irritations in your life? ").grid(row=i,
                                                                                                         column=0,
                                                                                                         sticky=tk.W)
        i += 1
        list1 = [("Never", 4),
                 ("Almost Never", 3),
                 ("Sometimes", 2),
                 ("Nearly often", 1),
                 ("Often", 0)]
        v_ps7 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_ps7, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.pss.set(self.pss.get() + v_ps7.get())
        # q8
        tk.Label(frame1, text="8. How often have you felt that you were on top of things? ").grid(row=i, column=0,
                                                                                               sticky=tk.W)
        i += 1
        list1 = [("Never", 4),
                 ("Almost Never", 3),
                 ("Sometimes", 2),
                 ("Nearly often", 1),
                 ("Often", 0)]
        v_ps8 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_ps8, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.pss.set(self.pss.get() + v_ps8.get())
        # q9
        tk.Label(frame1,
              text="9. How often have you been angered because of things that were outside of your control?").grid(
            row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Never", 0),
                 ("Almost Never", 1),
                 ("Sometimes", 2),
                 ("Nearly often", 3),
                 ("Often", 4)]
        v_ps9 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_ps9, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.pss.set(self.pss.get() + v_ps9.get())
        # q10
        tk.Label(frame1,
              text="10. How often have you felt difficulties were piling up so high that you could not overcome them? ").grid(
            row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Never", 0),
                 ("Almost Never", 1),
                 ("Sometimes", 2),
                 ("Nearly often", 3),
                 ("Often", 4)]
        v_ps10 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_ps10, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.pss.set(self.pss.get() + v_ps10.get())
        # ISI
        label8 = tk.Label(frame1,
                       text='\nISI: Over the last 2 weeks, how often have you been bothered by the following problems?')
        label8.grid(row=i, column=0, sticky=tk.W)
        i += 1
        self.isi = tk.IntVar()
        # q1
        tk.Label(frame1, text="1. Difficulty falling asleep ").grid(row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("None", 0),
                 ("Mild", 1),
                 ("Moderate", 2),
                 ("Severe", 3),
                 ("Very Severe", 4)]
        v_i1 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_i1, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.isi.set(self.isi.get() + v_i1.get())
        # q2
        tk.Label(frame1, text="2. Difficulty staying asleep ").grid(row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("None", 0),
                 ("Mild", 1),
                 ("Moderate", 2),
                 ("Severe", 3),
                 ("Very Severe", 4)]
        v_i2 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_i2, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.isi.set(self.isi.get() + v_i2.get())
        # q3
        tk.Label(frame1, text="3. Problems in waking up too early").grid(row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("None", 0),
                 ("Mild", 1),
                 ("Moderate", 2),
                 ("Severe", 3),
                 ("Very Severe", 4)]
        v_i3 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_i3, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.isi.set(self.isi.get() + v_i3.get())
        # q4
        tk.Label(frame1, text="4. How satisfied/dissatisfied are you with your current sleep pattern?").grid(row=i,
                                                                                                          column=0,
                                                                                                          sticky=tk.W)
        i += 1
        list1 = [("Very Satisfied", 0),
                 ("Satisfied", 1),
                 ("Moderately Satisfied", 2),
                 ("Dissatisfied", 3),
                 ("Very Dissatisfied", 4)]
        v_i4 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_i4, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.isi.set(self.isi.get() + v_i4.get())
        # q5
        tk.Label(frame1, text="5. How noticeable to others do you think your sleep problem is in terms of impairing the "
                           "quality of your life? ").grid(row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Not at all noticeable", 0),
                 ("A little", 1),
                 ("Somewhat", 2),
                 ("Much", 3),
                 ("Very Much Noticeable", 4)]
        v_i5 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_i5, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.isi.set(self.isi.get() + v_i5.get())
        # q6
        tk.Label(frame1, text="6. How worried distressed are you about your current sleep problem?").grid(row=i, column=0,
                                                                                                       sticky=tk.W)
        i += 1
        list1 = [("Not at all worried", 0),
                 ("A little", 1),
                 ("Somewhat", 2),
                 ("Much", 3),
                 ("Very Much Worried", 4)]
        v_i6 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_i6, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.isi.set(self.isi.get() + v_i6.get())
        # q7
        tk.Label(frame1, text="7. To what extent do you consider your sleep problem to interfere with your daily "
                           "functioning\n (e.g. daytime fatigue, mood, ability studying, concentration, memory, mood, "
                           "etc.) currently?  ").grid(row=i, column=0, sticky=tk.W)
        i += 1
        list1 = [("Not at all Interfering", 0),
                 ("A little", 1),
                 ("Somewhat", 2),
                 ("Much", 3),
                 ("Very Much Interfering", 4)]
        v_i7 = tk.IntVar()
        for ans, score in list1:
            tk.Radiobutton(frame1, text=ans, variable=v_i7, value=score).grid(row=i, column=0, sticky=tk.W)
            i += 1
        self.isi.set(self.isi.get() + v_i7.get())

    def create_button(self):
        canvas = self.canvas
        submit = tk.Button(canvas, text='Submit', command=self.allsubmit, anchor='nw')
        submit.pack(side=tk.BOTTOM, fill=tk.BOTH)

    def allsubmit(self):

        with open(r'user.txt', 'w') as f:
            f.write('Name：')
            f.write(self.name.get())
            f.write('\nSex:')
            f.write(self.sex.get())
            f.write('\nAge：')
            f.write(str(self.age.get()))
            f.write('\nOccupation：')
            f.write(self.occupation.get())
            f.write('\nGAD-7 Score:')
            f.write(str(self.gad.get()))
            f.write('\nPHQ-9 Score：')
            f.write(str(self.phq.get()))
            f.write('\nPSS：')
            f.write(str(self.pss.get()))
            f.write('\nISI:')
            f.write(str(self.isi.get()))
        messagebox.showinfo('Success', 'Sumbit! ')
