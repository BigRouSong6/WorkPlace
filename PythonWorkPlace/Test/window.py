# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'window.ui'
#
# Created by: PyQt5 UI code generator 5.14.2
#
# WARNING! All changes made in this file will be lost!


from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(300, 50)
        MainWindow.setContextMenuPolicy(QtCore.Qt.DefaultContextMenu)
        # 为窗口中的小部件设置上下文菜单和背景颜色和取名字
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setContextMenuPolicy(QtCore.Qt.PreventContextMenu) # 设置 self.centralwidget（一个 QWidget 对象）的上下文菜单策略。具体来说，它设置了上下文菜单为不可用
        self.centralwidget.setStyleSheet("QWidget#centralwidget{background:#1D1D1D;}") # 将 self.centralwidget 的背景颜色设置为深灰色
        self.centralwidget.setObjectName("centralwidget")
        # 创建一个新的 QGridLayout 布局，并将其应用于 self.centralwidget 部件
        self.gridLayout = QtWidgets.QGridLayout(self.centralwidget)
        self.gridLayout.setContentsMargins(0, 0, 0, 0) # 布局和内部部件全面贴合
        self.gridLayout.setSpacing(0)
        self.gridLayout.setObjectName("gridLayout")
        # 设置子部件-mem 内存控件---------------1
        self.widget_mem = QtWidgets.QWidget(self.centralwidget)
        self.widget_mem.setObjectName("widget_mem")
        self.gridLayout_5 = QtWidgets.QGridLayout(self.widget_mem)
        self.gridLayout_5.setContentsMargins(0, 0, 0, 0)
        self.gridLayout_5.setSpacing(0)
        self.gridLayout_5.setObjectName("gridLayout_5")
        # 创建一个新的 QPushButton 对象，并将其添加到 self.widget_mem 部件中，将新创建的按钮存储在 self.pushButton_mem 变量中
        self.pushButton_mem = QtWidgets.QPushButton(self.widget_mem)
        self.pushButton_mem.setEnabled(True) # 将 self.pushButton_mem 设置为启用状态
        # 设置控件对象的大小、字体属性
        self.pushButton_mem.setMinimumSize(QtCore.QSize(74, 0))
        self.pushButton_mem.setMaximumSize(QtCore.QSize(74, 16777215))
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        self.pushButton_mem.setFont(font)
        # 设置控件右键菜单为默认
        self.pushButton_mem.setContextMenuPolicy(QtCore.Qt.DefaultContextMenu)
        self.pushButton_mem.setStyleSheet("QPushButton{background:Transparent;color:white;text-align:left;padding:0}\n"
"QPushButton:hover{background:Transparent;color:white;text-align:left;padding:0}")
        self.pushButton_mem.setText("")
        self.pushButton_mem.setObjectName("pushButton_mem")
        #设置完上述属性，开始进行添加控件元素的位置
        self.gridLayout_5.addWidget(self.pushButton_mem, 0, 0, 1, 1)
        self.gridLayout.addWidget(self.widget_mem, 1, 1, 1, 1)

        #-----------------------------------------2
        self.widget_cpu = QtWidgets.QWidget(self.centralwidget)
        self.widget_cpu.setEnabled(True)
        self.widget_cpu.setContextMenuPolicy(QtCore.Qt.DefaultContextMenu)
        self.widget_cpu.setObjectName("widget_cpu")
        self.gridLayout_4 = QtWidgets.QGridLayout(self.widget_cpu)
        self.gridLayout_4.setContentsMargins(0, 0, 0, 0)
        self.gridLayout_4.setSpacing(0)
        self.gridLayout_4.setObjectName("gridLayout_4")
        self.pushButton_cpu = QtWidgets.QPushButton(self.widget_cpu)
        self.pushButton_cpu.setEnabled(True)
        self.pushButton_cpu.setMinimumSize(QtCore.QSize(74, 0))
        self.pushButton_cpu.setMaximumSize(QtCore.QSize(74, 16777215))
        font = QtGui.QFont()
        font.setFamily("微软雅黑")
        self.pushButton_cpu.setFont(font)
        self.pushButton_cpu.setContextMenuPolicy(QtCore.Qt.DefaultContextMenu)
        self.pushButton_cpu.setStyleSheet("QPushButton{background:Transparent;color:white;text-align:left;padding:0}\n"
"QPushButton:hover{background:Transparent;color:white;text-align:left;padding:0}")
        self.pushButton_cpu.setText("")
        self.pushButton_cpu.setObjectName("pushButton_cpu")
        self.gridLayout_4.addWidget(self.pushButton_cpu, 1, 0, 1, 1)
        self.gridLayout.addWidget(self.widget_cpu, 1, 0, 1, 1)
        # 设置一个Qt应用程序的主窗口的中心部件。这里，MainWindow 是一个主窗口对象，而 self.centralwidget 是你想要设置为这个主窗口中心部件的部件对象
        MainWindow.setCentralWidget(self.centralwidget)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)
        # 代码定义了当用户按下 tab 键时，焦点如何在两个按钮之间移动的顺序
        MainWindow.setTabOrder(self.pushButton_cpu, self.pushButton_mem)