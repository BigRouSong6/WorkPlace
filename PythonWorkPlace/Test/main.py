from PyQt5 import QtWidgets
from PyQt5.QtGui import QCursor
from win32 import win32gui
import pywintypes
import psutil
import qtawesome
import sys
import time
from PyQt5.QtWidgets import QApplication, QMenu, QAction, qApp, QMessageBox
from window import Ui_MainWindow
from PyQt5.QtCore import Qt, QThread, pyqtSignal
from mootdx.quotes import Quotes
import pandas as pd

class taskTool(Ui_MainWindow, QtWidgets.QMainWindow):

    def __init__(self):
        super(taskTool, self).__init__()
        self.setupUi(self)
        self.widthx = 150
        self.shiftx = 50
        # 获取任务栏实例并重置任务栏大小
        m_hTaskbar = win32gui.FindWindow("Shell_TrayWnd", None)
        m_hBar = win32gui.FindWindowEx(m_hTaskbar, 0, "ReBarWindow32", None)
        m_hMin = win32gui.FindWindowEx(m_hBar, 0, "MSTaskSwWClass", None)
        b = win32gui.GetWindowRect(m_hBar)
        win32gui.MoveWindow(m_hMin, 0, 0, b[2] - b[0] - self.widthx - self.shiftx, b[3] - b[1], True)  # 将MSTaskSwWClass缩小，预留窗口位置
        a = win32gui.GetWindowRect(m_hMin)
        #上述是为了获取要预留的位置大小

        
        win32gui.SetParent(int(self.winId()), m_hBar)  # 设置任务栏为此窗口的父窗口
        self.setGeometry(b[2] - b[0] - self.widthx - self.shiftx, 0, self.widthx, b[3] - b[1]) # 设置窗口或部件的大小和位置
        self.setWindowFlag(Qt.FramelessWindowHint)  # 无边框

        
        self.iconOnButton() # 开启图标
        self.mainThread() # 开启线程

        # 为2个图标添加右键菜单功能
        self.pushButton_mem.setContextMenuPolicy(Qt.CustomContextMenu)
        self.pushButton_mem.customContextMenuRequested.connect(self.rightMenuShow)
        self.pushButton_cpu.setContextMenuPolicy(Qt.CustomContextMenu)
        self.pushButton_cpu.customContextMenuRequested.connect(self.rightMenuShow)

        # 为窗口设置初始化的图标
    def iconOnButton(self):
        self.pushButton_cpu.setIcon(qtawesome.icon('ri.money-cny-circle-fill', color='white'))
        self.pushButton_mem.setIcon(qtawesome.icon('fa5s.chart-line', color='white'))
    
    def rightMenuShow(self, pos):  # 添加右键菜单
        menu = QMenu(self)
        menu.setStyleSheet("""\
                     QMenu {\
                     background-color:rgb(89,87,87); /*整个背景*/\
                     }\
                 QMenu::item {\
                     font-size: 10pt; \
                     color: rgb(225,225,225);  /*字体颜色*/\
                     background-color:rgb(89,87,87);\
                     padding:8px 10px; /*设置菜单项文字上下和左右的内边距，效果就是菜单中的条目左右上下有了间隔*/\
                     margin:2px 2px;/*设置菜单项的外边距*/\
                      }\
                 QMenu::item:selected { \
                     background-color:rgba(255,255,255,0.3);/*选中的样式*/\
                     }\
                 QMenu::item:pressed {/*菜单项按下效果*/\
                                           border: 1px solid rgb(60,60,61); \
                                           background-color: rgba(89,87,87, 0.5); \
                                       }\
                    """)
        quitAction = QAction("退出", self)
        quitAction.triggered.connect(self.appClose) # 创建一个名为“退出”的动作，并将其与appClose方法关联。当该动作被触发时，appClose方法将被调用
        menu.addAction(quitAction)
        menu.exec_(QCursor.pos()) #使用当前鼠标的位置作为菜单的初始位置，并显示该菜单

    def mainThread(self): # 这段代码创建了一个新的线程，并将一个特定的信号与一个方法（可能用于更新用户界面）连接起来，然后启动该线程
        try:
            self.main_thread = Main_Thread() # 创建一个下面自定义的类线程，进行数据的生成
            self.main_thread.thread_signal.connect(self.Update_UI)
            self.main_thread.start()
        except Exception as e:
            print(e)

    def Update_UI(self, msm):
        # 给图标赋予数值文本信息
        self.pushButton_mem.setText(f"{msm['mem']}")
        self.pushButton_cpu.setText(f"{msm['cpu']}")
        # 动态的更换涨跌幅图标
        if float(msm['mem'][:3])>0.01:
            
            self.pushButton_mem.setIcon(qtawesome.icon('ph.trend-up-bold', color='red'))
        elif float(msm['mem'][:3])<-0.01:
            
            self.pushButton_mem.setIcon(qtawesome.icon('ph.trend-down-bold', color='green'))
        else:
            self.pushButton_mem.setIcon(qtawesome.icon('fa5s.chart-line', color='white'))
            
        # 根据任务栏的常驻后台数量，自动变换位置，以防被遮挡
        m_hTaskbar = win32gui.FindWindow("Shell_TrayWnd", None)
        m_hBar = win32gui.FindWindowEx(m_hTaskbar, 0, "ReBarWindow32", None)
        b = win32gui.GetWindowRect(m_hBar)
        self.setGeometry(b[2] - b[0] - self.widthx - self.shiftx+50, 0, self.widthx, b[3] - b[1])
        
    def appClose(self):
        # 将任务栏调整回原来大小
        m_hTaskbar = win32gui.FindWindow("Shell_TrayWnd", None)
        m_hBar = win32gui.FindWindowEx(m_hTaskbar, 0, "ReBarWindow32", None)
        m_hMin = win32gui.FindWindowEx(m_hBar, 0, "MSTaskSwWClass", None)
        b = win32gui.GetWindowRect(m_hBar)
        win32gui.MoveWindow(m_hMin, 0, 0, b[2] - b[0], b[3] - b[1], True)
        a = win32gui.GetWindowRect(m_hMin)
        qApp.quit()


class Main_Thread(QThread):
    thread_signal = pyqtSignal(dict)

    def __init__(self):
        super().__init__()
        self.info = {
            "cpu": "",
            "mem": ""
        }
    def run(self):
        client = Quotes.factory(market='std')
        while True:
            #获取指定股票的行情
            data=client.quotes(symbol=["600938"])
            #获取实时价格
            df = pd.DataFrame(data)['price']
            #获取收盘价
            df_close = pd.DataFrame(data)['last_close']
            #计算涨跌幅
            change=(df-df_close)/df_close*100
            #取数组中的第一个值
            first_change=change.iloc[0]
            price_df=df.iloc[0]
            #将数组中的值转化为字符串
            str_change=str(first_change)[:4]
           
            str_df=str(price_df)
            #显示实时价格
            self.info['cpu'] = f"{str_df}"
            #显示百分比涨跌幅
            self.info['mem'] = f"{str_change}%"
            time.sleep(2)
            self.thread_signal.emit(self.info)


if __name__ == '__main__':
    QApplication.setAttribute(Qt.AA_EnableHighDpiScaling)
    app = QApplication(sys.argv)
    ex = taskTool()
    ex.show()
    sys.exit(app.exec_())