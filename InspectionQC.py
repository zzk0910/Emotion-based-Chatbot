import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import matplotlib as mpl
#mpl.rcParams['font.sans-serif'] = ['SimHei']
#mpl.rcParams['axes.unicode_minus'] = False

def QC_lineChart(inputPath, outDir):

    projectList = ['WBC', 'RBC', 'HGB', 'PLT']
    #设置图例的字体样式
    font_style = {
    'family': 'Times New Roman',
    'weight': 'normal',
    'size': 23,
    }
    #ExcelFile()中的方法来获取目标表格文件的相关信息
    f = pd.ExcelFile(inputPath)
    #循环读取每个sheet表的数据并绘制折线图
    for s_name in f.sheet_names:
        i = 0
        data = pd.read_excel(inputPath, sheet_name=s_name)
        #缺失值处理
        data.fillna(0, inplace=True)
        for project in projectList:
            # 计算各个指标
            mean = data.loc[i, 'X']
            i += 1
            std = data[project].std()#计算标准差
            #自定义基准线
            pos_1s = mean + std
            pos_2s = mean + 2 * std
            pos_3s = mean + 3 * std
            neg_1s = mean - std
            neg_2s = mean - 2 * std
            neg_3s = mean - 3 * std
            
            x = data['日期']
            y = data[project]
            #设置画布大小
            fig = plt.figure(figsize=(18, 9))
            #折线图
            plt.plot(x, y, marker='o', mec='b', mfc='w', label=project)
            #图例
            plt.legend(loc='upper right', prop=font_style)
            #自定义设置x轴间隔，默认间隔不为1
            x_major_locator = plt.MultipleLocator(1)
            ax = plt.gca()
            ax.xaxis.set_major_locator(x_major_locator)
            #设置x轴
            #x = pd.date_range('2021-06-01', '2021-06-30')
            #plt.plot(x, np.arange(len(x)))
            plt.xticks(rotation=30)

            #设置y轴，用符号代替具体数值
            y_ticks = [[mean, pos_1s, pos_2s, pos_3s, neg_1s, neg_2s, neg_3s],['X', 'X+1S', 'X+2S', 'X+3S', 'X-1S', 'X-2S', 'X-3S']]
            plt.yticks(y_ticks[0], y_ticks[1], fontsize=20)
            #仅显示y轴的网格
            plt.grid(axis='x')
            #设置标题
            plt.title(s_name + " " + project + " ", fontdict={'weight': 'normal', 'size': 26})
            #添加水平直线
            plt.axhline(y=mean, ls="-", c="red")  
            plt.axhline(y=pos_1s, ls="-", c="orange")
            plt.axhline(y=pos_2s, ls="-", c="yellow")
            plt.axhline(y=pos_3s, ls="-", c="green")
            plt.axhline(y=neg_1s, ls="-", c="blue")
            plt.axhline(y=neg_2s, ls="-", c="purple")

            # 坐标轴适应数据量
            plt.axis('tight')
            out_path = outDir + '/' + s_name + " " + project + ".png"
            plt.savefig(out_path)
            plt.close()
            yield out_path

if __name__ == '__main__':
    out = QC_lineChart('InspectionData.xlsx', '/Users/jingyu/Desktop/LittleGenesis/InspectionQC/')
    for name in out:
        print(name)
