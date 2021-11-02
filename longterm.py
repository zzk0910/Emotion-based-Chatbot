from tkinter import *
import numpy as np
import matplotlib
import matplotlib.pyplot as plt
from matplotlib.pylab import mpl
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg, NavigationToolbar2Tk
import pandas as pd

class Application(Frame):
     """一个经典的GUI写法"""

     def __init__(self, master=None):
         '''初始化方法'''
         super().__init__(master)  # 调用父类的初始化方法
         self.master = master
         self.pack(side=TOP, fill=BOTH, expand=1)  # 此处填充父窗体
         self.create_matplotlib()
         self.createWidget(self.figure)

     def createWidget(self, figure):
         """创建组件"""
         self.label = Label(self, text='Long-term Monitor of wulalabulala')
         self.label.pack()
         # 创建画布
         self.canvas = FigureCanvasTkAgg(figure, self)
         self.canvas.draw()
         self.canvas.get_tk_widget().pack(side=TOP, fill=BOTH, expand=1)
         # 把matplotlib绘制图形的导航工具栏显示到tkinter窗口上
         # toolbar = NavigationToolbar2Tk(self.canvas, self)
         # toolbar.update()
         # self.canvas._tkcanvas.pack(side=TOP, fill=BOTH, expand=1)
         # self.button = Button(master=self, text="退出", command=quit)
         # # 按钮放在下边
         # self.button.pack(side=BOTTOM)

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

         self.figure, axs = plt.subplots(1, 2, figsize=(10, 4))
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

         #plt.savefig('9.tiff', dpi=300)
         #plt.show()


     def destroy(self):
         super().destroy()
         quit()

     def quit():
         root.quit()  # 结束主循环
         root.destroy()  # 销毁窗口



if __name__ == '__main__':
     root = Tk()
     root.title('LONGTERM')
     root.geometry('560x400+200+200')
     app = Application(master=root)

     root.mainloop()