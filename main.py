import os
import sys
import time
from PyQt5.QtWidgets import QWidget, QApplication, QFileDialog
from InspectionQC import QC_lineChart

from MainWinHorizontalLayout import Ui_MainWindow
class QCForm(QWidget):
    def __init__(self):
        super().__init__()
        self.ui = Ui_QCForm()
        self.ui.setupUi(self)
        self.ui.pushButton_selectCatalog.setEnabled(False)  # 禁用选择目录按钮
        self.pathStr = ''
        self.out_dir = ''
        self.outPathMode = 1
        self.ui.pushButton_addFile.clicked.connect(self.pushButton_addFile)
        self.ui.radioButton_oriCatalog.toggled.connect(self.radioButton_oriCatalog)
        self.ui.radioButton_custom.toggled.connect(self.radioButton_custom)
        self.ui.pushButton_selectCatalog.clicked.connect(self.pushButton_selectCatalog)
        self.ui.pushButton_start.clicked.connect(self.pushButton_start)
        self.ui.pushButton_saveDir.clicked.connect(self.pushButton_openSave)
    def pushButton_addFile(self):

        file_name = QFileDialog.getOpenFileName(self,
                                                'Add File',
                                                "/Users/admin/Desktop/",
                                                "Excel Files(*.xlsx);;All File(*.*)")
        self.pathStr = file_name[0]
        file_extension = self.pathStr.split('.')[-1]
        if file_extension == 'xlsx':
            self.ui.lineEdit_inputPath.clear()
            self.ui.lineEdit_inputPath.setText(self.pathStr)
    def radioButton_oriCatalog(self):
        self.outPathMode = 1
        self.ui.lineEdit_outPath.clear()
        self.ui.pushButton_selectCatalog.setEnabled(False)
    def radioButton_custom(self):
        self.outPathMode = 2
        self.ui.pushButton_selectCatalog.setEnabled(True)
        self.ui.lineEdit_outPath.setReadOnly(True)
    def pushButton_selectCatalog(self):
        file_dir = QFileDialog.getExistingDirectory(self, "选择输出路径", os.getcwd())
        self.ui.lineEdit_outPath.setText(file_dir)
    def pushButton_start(self):
        self.ui.textBrowser.setText("开始输出图！")
        self.ui.textBrowser.append("===================================================================")
        if self.outPathMode == 1:
            self.out_dir = self.pathStr.rsplit('/', 1)[0]
            print(self.out_dir)
            out_path = QC_lineChart(self.pathStr, self.out_dir)
            for img_name in out_path:
                self.ui.textBrowser.append(img_name)
                time.sleep(0.2)
                QApplication.processEvents()
            self.ui.textBrowser.append("图已输出完毕！")
            self.ui.textBrowser.append("===================================================================")
        elif self.outPathMode == 2:
            self.out_dir = self.ui.lineEdit_outPath.text()
            out_path = QC_lineChart(self.pathStr, self.out_dir)
            for img_name in out_path:
                self.ui.textBrowser.append(img_name)
                time.sleep(0.2)
                QApplication.processEvents()
            self.ui.textBrowser.append("图已输出完毕！")
            self.ui.textBrowser.append("===================================================================")
    def pushButton_openSave(self):
        os.startfile(self.out_dir)
if __name__ == '__main__':
    app = QApplication(sys.argv)
    w = QCForm()
    w.show()
    sys.exit(app.exec_())
