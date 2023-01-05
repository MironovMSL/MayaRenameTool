import maya.cmds as cmds
from PySide2 import QtWidgets, QtGui, QtCore
from maya.app.general.mayaMixin import MayaQWidgetDockableMixin , MayaQWidgetBaseMixin
import os
import re
import json

root_ = os.path.dirname(__file__)
listButtonsName_path_ = os.path.join(root_, "listButtonsName.json")

# (MayaQWidgetDockableMixin, QtWidgets.QDockWidget):
# class MSL_RenameTool(MayaQWidgetBaseMixin, QtWidgets.QDialog):
class MSL_RenameTool(MayaQWidgetBaseMixin, QtWidgets.QDialog):

    def __init__(self):
        super(MSL_RenameTool, self).__init__()

        self.setup_ui()

        self.json_data = get_json_data()

    def setup_ui(self):

        self.setObjectName("MSL_RenameToolID")
        self.setWindowTitle('MSL Rename Tool')
        self.setMinimumWidth(400)
        self.setMaximumWidth(435)
        self.setMinimumHeight(315)
        self.setMaximumHeight(315)

        self.main_layout = QtWidgets.QVBoxLayout()
        # self.main_layout.setAlignment(QtCore.Qt.AlignTop)
        self.main_layout.setContentsMargins(10, 10, 10, 10)
        self.main_layout.setSpacing(0)
        self.setLayout(self.main_layout)

        self.test_btn = QtWidgets.QPushButton()
        self.main_layout.addWidget(self.test_btn)

        # self.setWindowFlags(QtCore.Qt.WindowStaysOnTopHint)
        # self.setWindowFlags(QtCore.Qt.FramelessWindowHint)



def get_json_data():
    json_data = None
    with open(listButtonsName_path_, "r") as inFile:
        json_data = json.load(inFile)

    return json_data

def set_json_data(json_data):
    with open(listButtonsName_path_, "w") as outfile:
        json.dump(json_data, outfile, indent=4)

def create_gui():

    if cmds.window("MSL_RenameToolID", exists=1):
        print("AAA")
        cmds.deleteUI("MSL_RenameToolID")

    if cmds.windowPref("MSL_RenameToolID", exists=1):
        cmds.windowPref("MSL_RenameToolID", remove=1)

    global Dialog
    Dialog = MSL_RenameTool()
    Dialog.show()

    cmds.window("MSL_RenameToolID", e =1, titleBar=1, toolbox=1,)



