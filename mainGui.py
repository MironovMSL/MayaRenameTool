import maya.cmds as cmds
from PySide2 import QtWidgets, QtGui, QtCore
from maya.app.general.mayaMixin import MayaQWidgetDockableMixin , MayaQWidgetBaseMixin
import os
import re
import sys
import json

root_ = os.path.dirname(__file__)

class NameMIMEData(QtCore.QMimeData):
    def __init__(self, text=None):
        super(NameMIMEData, self).__init__()

        if text:
            self.Name_Btn = text
        self.Name_Btn = ""
class DropLineEdit(QtWidgets.QLineEdit):
    itDropName = QtCore.Signal(str)

    def __init__(self, NameHolder = None):
        super(DropLineEdit, self).__init__()

        self.setAcceptDrops(True)
        self.setPlaceholderText(NameHolder)
        self.setFixedSize(120, 25)
        self.setClearButtonEnabled(True)
        self.setDragEnabled(True)
        self.setFont(QtGui.QFont("Arial", 10, QtGui.QFont.Normal))
        self.setAlignment(QtCore.Qt.AlignLeft)

        self.oldCursor = self.cursorPosition()
        self.oldMineData = ""

    def dragLeaveEvent(self, event):
        text = self.text()

        Name = self.oldMineData


        if Name in text:
            splitText = text.split(Name)
            text = splitText[0] + splitText[1]
        self.setText(text)

    def dragEnterEvent(self, event):
        event.acceptProposedAction()

        mimeData = event.mimeData()

        if mimeData.text():
            Name = "*" * len(mimeData.text())

        else:
            Name = "*" * len(mimeData.Name_Btn)


        self.oldMineData = Name
        posC = (event.pos().x()) // 10

        self.setCursorPosition(posC)
        self.setFocus()

        pos = self.cursorPosition()
        text = self.text()

        NewText = text[:pos] + Name + text[pos:]
        self.oldCursor = pos

        self.setText(NewText)

    def dragMoveEvent(self, event):
        event.acceptProposedAction()
        posC =( event.pos().x())//10
        self.setCursorPosition(posC)

        pos = self.cursorPosition()
        text = self.text()
        Name = self.oldMineData

        if self.oldCursor != pos:
            if Name in text:
                splitText = text.split(Name)
                Text = splitText[0] + splitText[1]
                NewText = Text[:pos] + Name + Text[pos:]
                self.oldCursor = pos

            else:
                NewText = text[:pos] + Name + text[pos:]
                self.oldCursor = pos

            self.setText(NewText)

    def dropEvent(self, event):
        # super(DropLineEdit, self).dropEvent(event)

        mimeData = event.mimeData()
        text = self.text()
        pos = self.oldCursor
        Name = self.oldMineData

        if mimeData.text():
            Name = mimeData.text()
            NameTemp = "*" * len(mimeData.text())

        else:
            Name = mimeData.Name_Btn
            NameTemp = "*" * len(mimeData.Name_Btn)

        if NameTemp in text:
            splitText = text.split(NameTemp)
            text = splitText[0] + splitText[1]

        if Name:
            NewText  = text[:pos] + Name + text[pos:]
            self.oldMineData = ""
            self.setText(NewText)
            self.itDropName.emit(NewText)

        event.source().setVisible(1)
class Separator_BTN(QtWidgets.QPushButton):

    def __init__(self, Width, Height):
        super(Separator_BTN, self).__init__()
        self.Style_btn = """
                            QPushButton {
                            background-color: rgb(68, 68, 68);}
                            """

        self.setVisible(0)
        self.setObjectName("Separator")
        # bg color
        self.setAutoFillBackground(True)
        self.p = self.palette()
        self.p.setColor(self.backgroundRole(), QtGui.QColor(80, 80, 80))
        self.setPalette(self.p)
        self.setFixedSize(Width,Height)
        self.setStyleSheet(self.Style_btn)
class Rename_BTN(QtWidgets.QPushButton):
    isEmitStateRename = QtCore.Signal(str, bool)
    def __init__(self):
        super(Rename_BTN, self).__init__()

        self.Style_btn = """
                            QPushButton {
                            background-color: rgb(20, 100, 90);
                            border-style: outset;
                            border-width: 1px;
                            border-radius: 3px;
                            border-color: beige;}
                            
                            QPushButton:hover{
                            border-color: beige;
                            background-color: rgb(20, 90, 90);}
                            
                            QPushButton:pressed{
                            background-color: rgb(107, 107, 107);}
                            """

        self.setObjectName("RenameID")
        self.setFixedSize(50, 25)
        self.setText("Rename")
        self.creat_context_menu()
        self.setStyleSheet(self.Style_btn)

    def enterEvent(self,event):
        self.setCursor(QtCore.Qt.PointingHandCursor)
        super(Rename_BTN, self).enterEvent(event)

    def leaveEvent(self, event):
        self.setCursor(QtCore.Qt.ArrowCursor)
        super(Rename_BTN, self).leaveEvent(event)

    def mousePressEvent(self, event):
        super(Rename_BTN, self).mousePressEvent(event)

        if event.buttons() == QtCore.Qt.RightButton:
            self.popMenu.exec_(self.mapToGlobal(event.pos()))

        self.setStyleSheet(self.Style_btn)

    def creat_context_menu(self):
        self.popMenu = QtWidgets.QMenu(self)
        self.popMenu.setTearOffEnabled(True)
        self.popMenu.setTitle("Rename")

        # Preff Suffix
        self.popMenu_PrefSuf = QtWidgets.QAction("prefix suffix in text field", self)
        self.popMenu_PrefSuf.setCheckable(True)
        # self.popMenu_PrefSuf.setChecked(True)
        self.popMenu.addAction(self.popMenu_PrefSuf)
        self.popMenu_PrefSuf.triggered.connect(self.Pref_Suf_State)

        # Separator Buttons
        # self.popMenu.addSeparator()
        self.separator_Buttons = QtWidgets.QAction("Buttons", self)
        self.separator_Buttons.setSeparator(True)
        self.separator_Buttons.priority()
        self.popMenu.addAction(self.separator_Buttons)

        # in Text
        self.popMenu_InText_sub = QtWidgets.QAction("in text field", self)
        self.popMenu_InText_sub.setCheckable(True)
        # self.popMenu_InText_sub.setChecked(True)
        self.popMenu.addAction(self.popMenu_InText_sub)
        self.popMenu_InText_sub.triggered.connect(self.State_in_text_field)

        # in Selection object
        self.popMenu_Object_sub = QtWidgets.QAction("in Selected object", self)
        self.popMenu_Object_sub.setCheckable(True)
        self.popMenu_Object_sub.setChecked(True)
        self.popMenu.addAction(self.popMenu_Object_sub)
        self.popMenu_Object_sub.triggered.connect(self.State_in_Selected_object)

        self.action_group_Buttons = QtWidgets.QActionGroup(self)

        self.action_group_Buttons.addAction(self.popMenu_InText_sub)
        self.action_group_Buttons.addAction(self.popMenu_Object_sub)

        # separator
        self.popMenu.addSeparator()
        # Number
        self.popMenu_Number = QtWidgets.QAction("Number", self)
        self.popMenu_Number.setCheckable(True)
        # self.popMenu_Number.setChecked(True)
        self.popMenu.addAction(self.popMenu_Number)
        self.popMenu_Number.triggered.connect(self.Number_state)

    def Pref_Suf_State(self, state):
        self.isEmitStateRename.emit("Pref_Suff", state )

    def State_in_text_field(self, state):
        self.isEmitStateRename.emit("text_field",state)

    def State_in_Selected_object(self, state):
        self.isEmitStateRename.emit("Selected_object", state)

    def Number_state(self, state):
        self.isEmitStateRename.emit("Number", state)

class Buttons_lib_name(QtWidgets.QPushButton):
    itClickedName = QtCore.Signal(str)

    def __init__(self, text= ""):
        super(Buttons_lib_name, self).__init__()

        self._text = text
        self.setObjectName(self._text)
        self.setFixedSize(60, 20)
        self.setText(self._text)

        # LineEdit setVisible
        self.NameLineEdit = QtWidgets.QLineEdit()
        self.NameLineEdit.setText(self._text)
        self.NameLineEdit.setAlignment(QtCore.Qt.AlignHCenter)

        self.NameLineEdit.setVisible(0)

        self.NameLineEdit.returnPressed.connect(self.setNewMame)

        self.main_layout = QtWidgets.QVBoxLayout()
        self.main_layout.setContentsMargins(0, 0, 0, 0)
        self.main_layout.setSpacing(0)
        self.setLayout(self.main_layout)

        self.main_layout.addWidget(self.NameLineEdit)

    def setNewMame (self):

        btnText = self.text()
        text    = self.NameLineEdit.text()
        self.setText(text)


        self.Rename_bnt()

        print("Rename button [{}] in [{}]".format( btnText, text ))

    def enterEvent(self,event):
        self.setCursor(QtCore.Qt.PointingHandCursor)
        super(Buttons_lib_name, self).enterEvent(event)

    def leaveEvent(self, event):
        self.setCursor(QtCore.Qt.ArrowCursor)
        super(Buttons_lib_name, self).leaveEvent(event)

    def mouseReleaseEvent(self, event):
        super(Buttons_lib_name, self).mouseReleaseEvent(event)
        self.itClickedName.emit(self.text())

    def mousePressEvent(self, event):

        super(Buttons_lib_name, self).mousePressEvent(event)
        if event.buttons() == QtCore.Qt.RightButton:

            self.creat_context_menu()
            self.popMenu.exec_(self.mapToGlobal(event.pos()))


        if event.buttons() != QtCore.Qt.MidButton:
            return

        self.setVisible(0)
        mimeData = NameMIMEData()
        mimeData.Name_Btn = self.text()

        # Creat ghost image
        self.pixmap = self.grab()
        painter = QtGui.QPainter(self.pixmap)

        painter.setCompositionMode(painter.CompositionMode_DestinationIn)
        painter.fillRect(self.pixmap.rect(), QtGui.QColor(80, 80, 80, 100))
        painter.end

        # start drag and drop
        drag = QtGui.QDrag(self)
        drag.setMimeData(mimeData)
        drag.setPixmap(self.pixmap)
        drag.setHotSpot(event.pos())


        drag.exec_(QtCore.Qt.LinkAction | QtCore.Qt.MoveAction)

    def creat_context_menu(self):

        self.popMenu = QtWidgets.QMenu(self)

        self.popMenuAdd = QtWidgets.QAction("Rename", self)
        self.popMenu.addAction(self.popMenuAdd)
        self.popMenuAdd.triggered.connect(self.Rename_bnt)

        self.popMenuDel = QtWidgets.QAction("Delete", self)
        self.popMenu.addAction(self.popMenuDel)
        self.popMenuDel.triggered.connect(self.Delete_btn)

    def Rename_bnt(self):
        vis = self.NameLineEdit.isVisible()
        if vis:
            self.NameLineEdit.setVisible(0)

        else:
            self.NameLineEdit.setVisible(1)
            self.NameLineEdit.setFocus()

    def Delete_btn(self):
        self.deleteLater()
        print("Delete button [{}]".format(self.text()))

class Buttons_fast_name(Buttons_lib_name):

    def __init__(self, text= ""):
        super(Buttons_fast_name, self).__init__(text)

        self.setFixedSize(40, 25)
        self.NameLineEdit.setFixedSize(40, 25)

    def creat_context_menu(self):

        self.popMenu = QtWidgets.QMenu(self)

        self.popMenuAdd = QtWidgets.QAction("Rename", self)
        self.popMenu.addAction(self.popMenuAdd)
        self.popMenuAdd.triggered.connect(self.Rename_bnt)

        self.popMenuDel = QtWidgets.QAction("Delete", self)
        self.popMenu.addAction(self.popMenuDel)
        self.popMenuDel.triggered.connect(self.Delete_btn)

class Buttons_lib_category(Buttons_lib_name):

    itClickedDelete = QtCore.Signal()
    itMoveLeftRight = QtCore.Signal(str,str)
    itRenameCategoty= QtCore.Signal(str)

    def __init__(self, text=""):
        super(Buttons_lib_category, self).__init__(text)

        self.Style_btn2 = """
                                          QPushButton {
                                          background-color: rgb(100, 100, 89);
                                          border-style: outset;
                                          border-width: 1px;
                                          border-radius: 5px;
                                          border-color: beige;
                                          font: bold 14px;
                                          font: 10pt, Arial;
                                          color: rgb(255, 255, 255);}
                                          QPushButton:hover{
                                          border-color: rgb(50, 50, 50);
                                          background-color: rgb(80, 80, 80);}
                                          QPushButton:pressed {
                                          background-color: rgb(224, 0, 0);
                                          border-style: inset;}
                                       """


        self.setStyleSheet(self.Style_btn2)
        self.creat_context_menu()


        self.NameLineEdit.setText(self._text)

    def mousePressEvent(self, event):

        super(Buttons_lib_name, self).mousePressEvent(event)
        if event.buttons() == QtCore.Qt.RightButton:



            self.popMenu.exec_(self.mapToGlobal(event.pos()))
            self.setStyleSheet(self.Style_btn2)

    def setNewMame(self):
        super(Buttons_lib_category, self).setNewMame()
        self.setStyleSheet(self.Style_btn2)
        self.itRenameCategoty.emit(self.text())

    def Delete_btn(self):
        self.deleteLater()

    def creat_context_menu(self):

        self.popMenu = QtWidgets.QMenu(self)
        self.popMenu.setTearOffEnabled(True)
        self.popMenu.setTitle(self.text())

        self.popMenuLeft = QtWidgets.QAction("Left", self)
        self.popMenu.addAction(self.popMenuLeft)
        self.popMenuLeft.triggered.connect(self.move_Left)

        self.popMenuRight = QtWidgets.QAction("Right", self)
        self.popMenu.addAction(self.popMenuRight)
        self.popMenuRight.triggered.connect(self.move_Right)

        self.popMenuRemane = QtWidgets.QAction("Rename", self)
        self.popMenu.addAction(self.popMenuRemane)
        self.popMenuRemane.triggered.connect(self.Rename_bnt)

        self.popMenuDel = QtWidgets.QAction("Delete", self)
        self.popMenu.addAction(self.popMenuDel)
        self.popMenuDel.triggered.connect(self.Delete_btn)

    def Rename_bnt(self):
        vis = self.NameLineEdit.isVisible()
        if vis:
            self.NameLineEdit.setVisible(0)

            # self.setVisible(0)
        else:
            self.NameLineEdit.setVisible(1)
            self.NameLineEdit.setFocus()

    def Delete_btn(self):
        self.itClickedDelete.emit()

    def move_Left(self):
        category = self.text()
        self.itMoveLeftRight.emit(category,"left")

    def move_Right(self):
        category = self.text()
        self.itMoveLeftRight.emit(category,"Right")

class Search_BTN(QtWidgets.QPushButton):

    isEmitState = QtCore.Signal(str)

    def __init__(self):
        super(Search_BTN, self).__init__()

        self.setObjectName("SearchNameID")
        self.setFixedSize(25, 25)
        self.setIcon(QtGui.QIcon(os.path.join(root_, "icons/search.svg")))
        self.CreatContextMenu()

    def enterEvent(self,event):
        self.setCursor(QtCore.Qt.PointingHandCursor)
        super(Search_BTN, self).enterEvent(event)

    def leaveEvent(self, event):
        self.setCursor(QtCore.Qt.ArrowCursor)
        super(Search_BTN, self).leaveEvent(event)

    def mousePressEvent(self, event):

        super(Search_BTN, self).mousePressEvent(event)
        if event.buttons() == QtCore.Qt.RightButton:

            self.popMenu.exec_(self.mapToGlobal(event.pos()))
            # self.setStyleSheet(self.Style_btn)

    def CreatContextMenu(self):

        self.popMenu = QtWidgets.QMenu(self)
        # self.popMenu.setTearOffEnabled(True)
        self.popMenu.setTitle("Replace state")

        self.popMenu_Selected = QtWidgets.QAction("Selected", self)
        self.popMenu.addAction(self.popMenu_Selected)
        self.popMenu_Selected.setCheckable(True)
        self.popMenu_Selected.setChecked(True)
        self.popMenu_Selected.triggered.connect(self.emitSelected)

        self.popMenu_Hierarchy = QtWidgets.QAction("Hierarchy", self)
        self.popMenu.addAction(self.popMenu_Hierarchy)
        self.popMenu_Hierarchy.setCheckable(True)
        self.popMenu_Hierarchy.triggered.connect(self.emitHierarchy)

        self.popMenu_All = QtWidgets.QAction("All", self)
        self.popMenu.addAction(self.popMenu_All)
        self.popMenu_All.setCheckable(True)
        self.popMenu_All.triggered.connect(self.emitAll)

        self.action_group = QtWidgets.QActionGroup(self)

        self.action_group.addAction(self.popMenu_Selected)
        self.action_group.addAction(self.popMenu_Hierarchy)
        self.action_group.addAction(self.popMenu_All)

    def emitSelected(self):
        self.isEmitState.emit("Selected")

    def emitHierarchy(self):
        self.isEmitState.emit("Hierarchy")

    def emitAll(self):
        self.isEmitState.emit("All")

class Replace_BTN(QtWidgets.QPushButton):

    isEmitState = QtCore.Signal(str)

    def __init__(self):
        super(Replace_BTN, self).__init__()

        self.setObjectName("ReplaceNameID")
        self.setFixedSize(25, 25)
        self.setIcon(QtGui.QIcon(os.path.join(root_, "icons/repeat.svg")))
        self.CreatContextMenu()

    def enterEvent(self,event):
        self.setCursor(QtCore.Qt.PointingHandCursor)
        super(Replace_BTN, self).enterEvent(event)

    def leaveEvent(self, event):
        self.setCursor(QtCore.Qt.ArrowCursor)
        super(Replace_BTN, self).leaveEvent(event)

    def mousePressEvent(self, event):

        super(Replace_BTN, self).mousePressEvent(event)
        if event.buttons() == QtCore.Qt.RightButton:

            self.popMenu.exec_(self.mapToGlobal(event.pos()))
            # self.setStyleSheet(self.Style_btn)

    def CreatContextMenu(self):

        self.popMenu = QtWidgets.QMenu(self)
        # self.popMenu.setTearOffEnabled(True)
        self.popMenu.setTitle("Replace state")

        self.popMenu_Selected = QtWidgets.QAction("Selected", self)
        self.popMenu.addAction(self.popMenu_Selected)
        self.popMenu_Selected.setCheckable(True)
        self.popMenu_Selected.setChecked(True)
        self.popMenu_Selected.triggered.connect(self.emitSelected)

        self.popMenu_Hierarchy = QtWidgets.QAction("Hierarchy", self)
        self.popMenu.addAction(self.popMenu_Hierarchy)
        self.popMenu_Hierarchy.setCheckable(True)
        self.popMenu_Hierarchy.triggered.connect(self.emitHierarchy)

        self.popMenu_All = QtWidgets.QAction("All", self)
        self.popMenu.addAction(self.popMenu_All)
        self.popMenu_All.setCheckable(True)
        self.popMenu_All.triggered.connect(self.emitAll)

        self.action_group = QtWidgets.QActionGroup(self)

        self.action_group.addAction(self.popMenu_Selected)
        self.action_group.addAction(self.popMenu_Hierarchy)
        self.action_group.addAction(self.popMenu_All)

    def emitSelected(self):
        self.isEmitState.emit("Selected")

    def emitHierarchy(self):
        self.isEmitState.emit("Hierarchy")

    def emitAll(self):
        self.isEmitState.emit("All")

class Buttons_ADD (QtWidgets.QPushButton):

    itToggleBox = QtCore.Signal(bool)

    def __init__(self):
        super(Buttons_ADD, self).__init__()

        self.setObjectName("AddNameID")
        # self.setStyleSheet("background-color: rgba(255, 255, 255,50);")
        # self.setText("add")
        self.setMaximumSize(20,20)
        self.setIcon(QtGui.QIcon(os.path.join(root_, "icons/plus.svg")))
        self.CreatContextMenu()

    def enterEvent(self,event):
        self.setCursor(QtCore.Qt.PointingHandCursor)
        super(Buttons_ADD, self).enterEvent(event)

    def leaveEvent(self, event):
        self.setCursor(QtCore.Qt.ArrowCursor)
        super(Buttons_ADD, self).leaveEvent(event)

    def mousePressEvent(self, event):

        if event.buttons() == QtCore.Qt.RightButton:
            self.popMenu.exec_(self.mapToGlobal(event.pos()))

        super(Buttons_ADD, self).mousePressEvent(event)

    def CreatContextMenu(self):

        self.popMenu = QtWidgets.QMenu(self)
        # self.popMenu.setTearOffEnabled(True)
        self.popMenu.setTitle("add state")

        self.popMenuButtons = QtWidgets.QAction("Button", self)
        self.popMenu.addAction(self.popMenuButtons)
        self.popMenuButtons.setCheckable(True)
        self.popMenuButtons.setChecked(True)
        self.popMenuButtons.triggered.connect(self.Add_button)

        self.popMenuCategory = QtWidgets.QAction("Category", self)
        self.popMenu.addAction(self.popMenuCategory)
        self.popMenuCategory.setCheckable(True)
        self.popMenuCategory.triggered.connect(self.Add_Category)

        self.action_group_Buttons = QtWidgets.QActionGroup(self)

        self.action_group_Buttons.addAction(self.popMenuButtons)
        self.action_group_Buttons.addAction(self.popMenuCategory)

    def Add_Category(self, state):

        self.popMenuCategory.setChecked(True)
        self.popMenuButtons.setChecked(False)

        self.itToggleBox.emit(False)

    def Add_button(self, state):

        self.popMenuButtons.setChecked(True)
        self.popMenuCategory.setChecked(False)

        self.itToggleBox.emit(True)

class MyScrollArea(QtWidgets.QScrollArea):

    itClickedName = QtCore.Signal(str)

    def __init__(self, key = None, OriLayout = QtWidgets.QHBoxLayout()):
        super(MyScrollArea, self).__init__()

        self.key = key
        self.index = int

        scroll_style = """QScrollBar:horizontal {
                            background: rgb(10, 10, 10);
                            height: 5px;
                            margin: 0px 0 0 0px;
                        }
                        QScrollBar::handle:horizontal {
                            border: 1px rgb(0,0,0);
                            background: rgb(80, 80, 80);
                        }
                        """
        self.setObjectName("fast_access")

        self.setFixedWidth(250)

        self.setWidgetResizable(True)
        self.setAcceptDrops(True)

        self.setFocusPolicy(QtCore.Qt.NoFocus)
        self.setFrameShape(QtWidgets.QFrame.NoFrame)
        self.setVerticalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)

        self.scrollbar = QtWidgets.QScrollBar()
        self.scrollbar.setStyleSheet(scroll_style)
        self.setHorizontalScrollBar(self.scrollbar)


        self.scroll_area_widget = QtWidgets.QWidget()
        self.setWidget(self.scroll_area_widget)


        self.scroll_area_widget_layout = OriLayout
        self.scroll_area_widget_layout.setAlignment(QtCore.Qt.AlignTop)
        self.scroll_area_widget_layout.setContentsMargins(0, 0, 0, 0)
        self.scroll_area_widget_layout.setSpacing(2)

        self.scroll_area_widget.setLayout(self.scroll_area_widget_layout)

        self.Add_Buttons()

    def Add_Buttons(self):
        self.json_data = get_json_data()
        self.Separator = Separator_BTN(40, 25)
        self.scroll_area_widget_layout.addWidget(self.Separator)

        for i in self.json_data[self.key]:
            self.fast_access_BTN = Buttons_fast_name(i)
            self.scroll_area_widget_layout.addWidget(self.fast_access_BTN)
            self.fast_access_BTN.itClickedName.connect(self.receiveSignal)

    def receiveSignal(self, text):
        self.itClickedName.emit(text)

    def dragLeaveEvent(self, event):

        Count = self.scroll_area_widget_layout.count()
        for num, i in enumerate(range(Count), start=1):
            widget = self.scroll_area_widget_layout.itemAt(i).widget()
            widetName = widget.objectName()
            if widetName == "Separator":

                continue
            visibl = widget.isVisible()
            if visibl == False:
                widget.setVisible(1)
                self.scroll_area_widget_layout.insertWidget(self.index, widget)

        self.Separator.setVisible(0)

    def dragEnterEvent(self, event):
        event.acceptProposedAction()

        event.source().setVisible(0)
        self.Separator.setVisible(1)

        indexX   = event.pos().x()//40

        self.scroll_area_widget_layout.insertWidget(indexX, self.Separator)
        self.index = indexX

    def dragMoveEvent(self, event):
        event.acceptProposedAction()

        Count = self.scroll_area_widget_layout.count()
        for num, i in enumerate(range(Count), start=1):
            item = self.scroll_area_widget_layout.itemAt(i)
            widet = item.widget().objectName()
            visibl = item.widget().isVisible()

        self.Separator.setVisible(1)
        indexX = event.pos().x() // 40


        self.scroll_area_widget_layout.insertWidget(indexX, self.Separator)
        self.index = indexX

    def dropEvent(self, event):

        mimeData = event.mimeData()
        if mimeData.text():
            Name = mimeData.text()
        else:
            Name = mimeData.Name_Btn

        Count = self.scroll_area_widget_layout.count()
        indexX = (event.pos().x() // 50)



        listW = []

        Index = int
        for i in range(Count):
            item = self.scroll_area_widget_layout.itemAt(i)
            widet = item.widget().objectName()
            if Name == widet:
                Index = i

            listW.append(widet)

        self.Separator.setVisible(0)

        if Name in listW:

            widet = self.scroll_area_widget_layout.itemAt(Index).widget()
            widet.setVisible(1)
            self.scroll_area_widget_layout.insertWidget(indexX, widet)

            # print("this name [{}] already exists in [{}]".format(Name, self.objectName()))


        else:

            self.fast_access_BTN = Buttons_fast_name(Name)
            self.scroll_area_widget_layout.insertWidget(indexX, self.fast_access_BTN)
            self.fast_access_BTN.itClickedName.connect(self.receiveSignal)

            Count = self.scroll_area_widget_layout.count()

            for num, i in enumerate(range(Count), start=1):

                item = self.scroll_area_widget_layout.itemAt(i)
                widet = item.widget().objectName()


            event.source().setVisible(1)

            # print("this name [{}] move in [{}]".format(Name, self.objectName()))

class FieldScrollArea(QtWidgets.QWidget):

    itClickedName   = QtCore.Signal(str)
    itMoveLeftRight = QtCore.Signal(str, str)
    itUpdateCatagory= QtCore.Signal()
    itDeleteCategory= QtCore.Signal(str)


    def __init__(self,text = ""):
        super(FieldScrollArea, self).__init__()

        self.json_data = get_json_data()
        self._text = text
        self.setObjectName(text)
        self.setMaximumWidth(60)
        self.setAcceptDrops(True)

        # main layout
        self.main_layout = QtWidgets.QVBoxLayout()
        self.main_layout.setContentsMargins(0, 0, 0, 0)
        self.main_layout.setSpacing(0)
        self.setLayout(self.main_layout)

        # layout: categoryBtn and layout: scroll area
        self.categoryBtn_layout = QtWidgets.QVBoxLayout()
        self.categoryScroll_area_layout = QtWidgets.QVBoxLayout()

        self.categoryBtn_layout.setContentsMargins(0, 0, 0, 0)
        self.categoryBtn_layout.setSpacing(0)
        self.categoryScroll_area_layout.setContentsMargins(0, 0, 0, 0)
        self.categoryScroll_area_layout.setSpacing(0)

        self.main_layout.addLayout(self.categoryBtn_layout)
        self.main_layout.addLayout(self.categoryScroll_area_layout)

        # categoryBtn
        self.categoryBtn = Buttons_lib_category(text)
        self.categoryBtn.itClickedDelete.connect(self.Delete_Category)
        self.categoryBtn.itMoveLeftRight.connect(self.CategoryMoveLeftRight)
        self.categoryBtn.itRenameCategoty.connect(self.RenameCategory)
        self.categoryBtn.itClickedName.connect(self.receiveSignal)

        self.categoryBtn_layout.addWidget(self.categoryBtn)

        # scroll area
        self.categoryScroll_area = QtWidgets.QScrollArea()
        self.categoryScroll_area.setMaximumWidth(60)
        self.categoryScroll_area.setWidgetResizable(True)
        self.categoryScroll_area.setFocusPolicy(QtCore.Qt.NoFocus)
        self.categoryScroll_area.setFrameShape(QtWidgets.QFrame.NoFrame)
        self.categoryScroll_area.setVerticalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)
        self.categoryScroll_area.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)

        self.value_Btn_widget = QtWidgets.QWidget()


        self.categoryScroll_area.setWidget(self.value_Btn_widget)

        self.value_Btn_widget_layout = QtWidgets.QVBoxLayout()
        self.value_Btn_widget_layout.setObjectName(text + "layout")
        self.value_Btn_widget_layout.setAlignment(QtCore.Qt.AlignTop)
        self.value_Btn_widget_layout.setContentsMargins(0, 0, 0, 0)
        self.value_Btn_widget_layout.setSpacing(0)

        self.value_Btn_widget.setLayout(self.value_Btn_widget_layout)

        self.categoryScroll_area_layout.addWidget(self.categoryScroll_area)

        # add separator BTN
        self.Separator = Separator_BTN(60,20)
        self.value_Btn_widget_layout.addWidget(self.Separator)

        # add btn in sroll area
        if self.json_data["ListName"].get(text):
            for i in  self.json_data["ListName"].get(text) :
                self.value_Btn = Buttons_lib_name(i)
                self.value_Btn_widget_layout.addWidget(self.value_Btn)
                self.value_Btn.itClickedName.connect(self.receiveSignal)

    def RenameCategory (self, text):
        self.setObjectName(text)
        self.itUpdateCatagory.emit()

    def CategoryMoveLeftRight(self, text, pos):
        self.itMoveLeftRight.emit(text,pos)

    def Delete_Category(self):
        self.deleteLater()
        # print(self.objectName(), "delete")
        self.itDeleteCategory.emit(self.objectName())

    def receiveSignal(self, text):
        self.itClickedName.emit(text)

    def dragEnterEvent(self, event):
        event.acceptProposedAction()
        self.Separator.setVisible(1)
        indexY = (event.pos().y() - 20) // 20
        if indexY == -1:
            indexY = 0
        self.value_Btn_widget_layout.insertWidget(indexY, self.Separator)

    def dragLeaveEvent(self, event):

        self.Separator.setVisible(0)

    def dragMoveEvent(self, event):
        event.acceptProposedAction()

        # event.source().setVisible(1)
        self.Separator.setVisible(1)
        indexY = (event.pos().y() - 20) // 20
        if indexY == -1:
            indexY = 0
        self.value_Btn_widget_layout.insertWidget(indexY, self.Separator)

    def dropEvent(self, event):

        mimeData = event.mimeData()
        if mimeData.text():
            Name = mimeData.text()
        else:
            Name = mimeData.Name_Btn

        Count    = self.value_Btn_widget_layout.count()
        indexY   = (event.pos().y() - 20)//20
        listW    = []
        if indexY == -1:
            indexY = 0

        Index = int
        for i in range(Count):
            item  = self.value_Btn_widget_layout.itemAt(i)
            widet = item.widget().objectName()
            if Name == widet:
                Index = i

            listW.append(widet)

        self.Separator.setVisible(0)

        if Name in listW:

            widet  = self.value_Btn_widget_layout.itemAt(Index).widget()
            widet.setVisible(1)


            # print("this name [{}] already exists in [{}]".format(Name,  self.objectName()))
            self.value_Btn_widget_layout.insertWidget(indexY, widet)

        else:
            self.Btn_lib_name = Buttons_lib_name(text = Name)
            self.value_Btn_widget_layout.insertWidget(indexY,self.Btn_lib_name)
            self.Btn_lib_name.itClickedName.connect(self.receiveSignal)

            event.source().deleteLater()

            # print("this name [{}] move in [{}]".format(Name, self.objectName()))

class LibraryName(MayaQWidgetBaseMixin, QtWidgets.QDialog):
    itClickedName = QtCore.Signal(str)

    def __init__(self):
        super(LibraryName, self).__init__()

        self.json_data = get_json_data()

        self.setapUI()
        self.menuBarLib()

    def setapUI(self):

        self.setObjectName("libNameID")
        self.setWindowFlags(QtCore.Qt.WindowStaysOnTopHint)
        self.setMinimumSize(180, 200)
        self.setMaximumSize(420, 350)
        self.resize(300, 210)

        self.setWindowTitle("Lib Name")

        self.setWindowFlags(QtCore.Qt.FramelessWindowHint)

        self.main_layout = QtWidgets.QVBoxLayout()
        self.main_layout.setSpacing(0)
        self.main_layout.setAlignment(QtCore.Qt.AlignTop)
        self.main_layout.setContentsMargins(0, 0, 0, 0)
        self.setLayout(self.main_layout)

        self.shadow_frame = QtWidgets.QFrame()
        self.shadow_frame.setFrameShape(QtWidgets.QFrame.NoFrame)
        # self.shadow_frame.setStyleSheet(
        #     "background-color: rgb(10, 52, 61);")

        self.shadow_Layout = QtWidgets.QVBoxLayout()
        self.shadow_Layout.setContentsMargins(0, 0, 0, 0)
        self.shadow_Layout.setSpacing(0)

        self.shadow_frame.setLayout(self.shadow_Layout)
        self.main_layout.addWidget(self.shadow_frame)

        #  scroll area
        self.scroll_area = QtWidgets.QScrollArea()
        # self.scroll_area.setMinimumHeight(200)
        self.scroll_area.setWidgetResizable(True)
        self.scroll_area.setFocusPolicy(QtCore.Qt.NoFocus)
        self.scroll_area.setFrameShape(QtWidgets.QFrame.NoFrame)
        self.scroll_area.setVerticalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)

        self.scroll_area_widget = QtWidgets.QWidget()
        self.scroll_area.setWidget(self.scroll_area_widget)

        self.scroll_layout = QtWidgets.QHBoxLayout()
        self.scroll_layout.setObjectName("CategoryID")
        self.scroll_layout.setAlignment(QtCore.Qt.AlignTop)
        self.scroll_layout.setContentsMargins(0, 0, 0, 0)
        self.scroll_layout.setSpacing(0)

        self.scroll_area_widget.setLayout(self.scroll_layout)

        self.shadow_Layout.addWidget(self.scroll_area)

        # layout
        self.field_btn_layout = QtWidgets.QHBoxLayout()
        self.field_btn_layout.setContentsMargins(0, 0, 0, 0)
        self.field_btn_layout.setSpacing(0)

        self.shadow_Layout.addLayout(self.field_btn_layout)

        # fiel
        self.add_field_name = QtWidgets.QLineEdit()
        self.add_field_name.setClearButtonEnabled(True)
        self.add_field_name.returnPressed.connect(self.add_new_buttons)

        # btn
        self.add_bnt_name = Buttons_ADD()
        self.add_bnt_name.clicked.connect(self.add_new_buttons)
        self.add_bnt_name.itToggleBox.connect(self.ToggleComboBox)

        # combobox
        self.add_category = QtWidgets.QComboBox()

        for key in self.json_data["ListName"].keys():
            self.add_category.addItem(key)

        self.add_field_name.setPlaceholderText("Name")
        self.add_field_name.setMaximumSize(120, 30)

        self.add_category.setMaximumSize(80, 30)

        self.field_btn_layout_ofset = QtWidgets.QHBoxLayout()
        self.field_btn_layout_ofset.setContentsMargins(2, 2, 2, 2)
        self.field_btn_layout_ofset.setSpacing(2)

        self.field_btn_layout_ofset.addWidget(self.add_field_name)
        self.field_btn_layout_ofset.addWidget(self.add_bnt_name)
        self.field_btn_layout_ofset.addWidget(self.add_category)

        self.field_btn_layout.addLayout(self.field_btn_layout_ofset)

        # add Btn
        for i in self.json_data["ListName"].keys():
            self.btn_scrol_area = FieldScrollArea(i)
            self.scroll_layout.addWidget(self.btn_scrol_area)
            self.btn_scrol_area.itClickedName.connect(self.receiveSignal)
            self.btn_scrol_area.itMoveLeftRight.connect(self.CategoryMoveLeftRight)
            self.btn_scrol_area.itUpdateCatagory.connect(self.Update_Catagory)
            self.btn_scrol_area.itDeleteCategory.connect(self.Update_deleteCatagory)

        Index = len(self.json_data["ListName"])
        if Index > 3:
            SizeWidth = 60 * Index
            self.setMaximumWidth(SizeWidth)
        else:
            self.setMaximumWidth(180)

    def menuBarLib(self):


        self.menuBar = QtWidgets.QMenuBar()
        self.main_layout.setMenuBar(self.menuBar)
        #  MENU Edit
        self.Edit_menu = self.menuBar.addMenu(QtGui.QIcon(os.path.join(root_, "icons/tool.svg")),"Edit")
        self.Edit_menu.setTearOffEnabled(True)

        # Save
        self.Edit_menu_Save = QtWidgets.QAction("Save", self)
        self.Edit_menu.addAction(self.Edit_menu_Save)
        self.Edit_menu_Save.triggered.connect(self.Save)
        # Reset
        self.Edit_menu_Reset = QtWidgets.QAction("Reset", self)
        self.Edit_menu.addAction(self.Edit_menu_Reset)
        self.Edit_menu_Reset.triggered.connect(self.Reset)

        # Separator objects
        self.separator_object = QtWidgets.QAction("Objects", self)
        self.separator_object.setSeparator(True)
        self.Edit_menu.addAction(self.separator_object)


        # Add Name
        self.Edit_menu_subm_name = self.Edit_menu.addMenu("New Name")
        # self.Edit_menu_subm_name.setTearOffEnabled(True)

        self.subMenuButtons = QtWidgets.QAction("Button", self)
        self.Edit_menu_subm_name.addAction(self.subMenuButtons)
        self.subMenuButtons.setCheckable(True)
        self.subMenuButtons.setChecked(True)
        self.subMenuButtons.triggered.connect(self.Menu_Add_button)

        self.suMenuCategory = QtWidgets.QAction("Category", self)
        self.Edit_menu_subm_name.addAction(self.suMenuCategory)
        self.suMenuCategory.setCheckable(True)
        self.suMenuCategory.triggered.connect(self.Menu_Add_Category)

        self.action_group_Buttons = QtWidgets.QActionGroup(self)

        self.action_group_Buttons.addAction(self.subMenuButtons)
        self.action_group_Buttons.addAction(self.suMenuCategory)

        # find duplicate names
        self.Edit_menu_find_Name = QtWidgets.QAction("Find duplicate names",self)
        self.Edit_menu.addAction(self.Edit_menu_find_Name)
        self.Edit_menu_find_Name.triggered.connect(self.Find_duplicate_names)

        # # seprator
        self.Edit_menu.addSeparator()

        #  MENU Help
        self.Help_menu = self.Edit_menu.addMenu("Help")
        # self.Help_menu.setTearOffEnabled(True)

        # info
        self.Help_menu_Info = QtWidgets.QAction("Info", self)
        self.Help_menu.addAction(self.Help_menu_Info)

    def Reset(self):

        self.json_data["ListName"] = self.json_data["ListNameDefault"]

        set_json_data(self.json_data)

        Count = self.scroll_layout.count()
        for i in range(Count):
            key_W = self.scroll_layout.itemAt(i).widget()

            key_W.deleteLater()

        self.add_category.clear()

        for key in self.json_data["ListName"].keys():
            self.add_category.addItem(key)

        for i in self.json_data["ListName"].keys():
            self.btn_scrol_area = FieldScrollArea(i)
            self.scroll_layout.addWidget(self.btn_scrol_area)
            self.btn_scrol_area.itClickedName.connect(self.receiveSignal)
            self.btn_scrol_area.itMoveLeftRight.connect(self.CategoryMoveLeftRight)
            self.btn_scrol_area.itUpdateCatagory.connect(self.Update_Catagory)
            self.btn_scrol_area.itDeleteCategory.connect(self.Update_deleteCatagory)

        Index = len(self.json_data["ListName"])
        if Index > 3:
            SizeWidth = 60 * Index
            self.setMaximumWidth(SizeWidth)
        else:
            self.setMaximumWidth(180)

        print("Reset Setting")

    def Save(self):
        Count = self.scroll_layout.count()
        key = []
        listValue = {}

        for i in range(Count):
            key_W = self.scroll_layout.itemAt(i).widget()
            key_W_Name = key_W.objectName()
            key.append(key_W_Name)

            CauntW = key_W.value_Btn_widget_layout.count()
            listForKey = []
            for a in range(CauntW):
                Value_W = key_W.value_Btn_widget_layout.itemAt(a).widget().objectName()
                if Value_W == "Separator":
                    continue
                listForKey.append(Value_W)

            listValue[key_W_Name] = listForKey

        self.json_data["ListName"] = listValue

        set_json_data(self.json_data)

        print("Save Setting")

    def Find_duplicate_names(self):

        Count = self.scroll_layout.count()
        key = []
        listValue = {}

        for i in range(Count):
            key_W = self.scroll_layout.itemAt(i).widget()
            key_W_Name = key_W.objectName()
            key.append(key_W_Name)

            CauntW = key_W.value_Btn_widget_layout.count()
            listForKey = []
            for a in range(CauntW):
                Value_W = key_W.value_Btn_widget_layout.itemAt(a).widget().objectName()
                listForKey.append(Value_W)

            listValue [key_W_Name] = listForKey

        duplicate = []

        for index , NameKey1 in enumerate(key, start=1):  # [{'Default'}, 'Postfixes', 'Base', 'Limbs', 'Fingers', 'Face', 'Other']
            for i in listValue[NameKey1]: # {'Default': [i,...]}Separator

                duplicate_in_Category = []

                if i in duplicate or i == "Separator":
                    continue

                for NameKey2 in key[index:]:   # ['Default', {'Postfixes'}, 'Base', 'Limbs', 'Fingers', 'Face', 'Other']
                    for j in listValue[NameKey2]: # {'Postfixes': [j,...]},
                        if i == j: # {'Default': [i,...]} == {'Postfixes': [j,...]},

                            duplicate_in_Category.append(NameKey2)
                            duplicate.append(i)
                            break

                if duplicate_in_Category:
                    print("{}. Name[{}] in ['{}'] {}".format(index, i, NameKey1, duplicate_in_Category))
        else:
            print("Names not found")

    def Menu_Add_Category(self, state):

        self.suMenuCategory.setChecked(True)
        self.subMenuButtons.setChecked(False)
        # button menu
        self.add_bnt_name.popMenuCategory.setChecked(True)
        self.add_bnt_name.popMenuButtons.setChecked(False)
        self.ToggleComboBox(False)

    def Menu_Add_button(self, state):

        self.suMenuCategory.setChecked(False)
        self.subMenuButtons.setChecked(True)
        # button menu
        self.add_bnt_name.popMenuCategory.setChecked(False)
        self.add_bnt_name.popMenuButtons.setChecked(True)
        self.ToggleComboBox(True)

    def ToggleComboBox(self, bool):
        self.add_category.setVisible(bool)

        if bool:
            self.add_field_name.setPlaceholderText("Name")
            self.add_bnt_name.setIcon(QtGui.QIcon(os.path.join(root_, "icons/plus.svg")))
            self.suMenuCategory.setChecked(False)
            self.subMenuButtons.setChecked(True)
        else:
            self.add_field_name.setPlaceholderText("Category")
            self.add_bnt_name.setIcon(QtGui.QIcon(os.path.join(root_, "icons/file-plus.svg")))
            self.suMenuCategory.setChecked(True)
            self.subMenuButtons.setChecked(False)

    def add_new_buttons(self):

        Buttons       = self.add_bnt_name.popMenuButtons.isChecked()
        Category      =  self.add_bnt_name.popMenuCategory.isChecked()
        CategoryinBox = self.add_category.currentText()
        nameField     = self.add_field_name.text()
        Count         = self.scroll_layout.count()

        if Buttons:

            for i in range(Count):
                item           = self.scroll_layout.itemAt(i)
                widget         = item.widget()

                listWidget = []

                if widget.objectName() == CategoryinBox:
                    CauntW = widget.value_Btn_widget_layout.count()
                    for a in range(CauntW):

                        ItemW = widget.value_Btn_widget_layout.itemAt(a)
                        widgetBtn      = ItemW.widget()
                        NameWidget     = widgetBtn.objectName()

                        listWidget.append(NameWidget)

                    if nameField:
                        if nameField in listWidget:

                            print("this name [{}] already exists in [{}]".format(nameField, CategoryinBox))

                        else:
                            widget.newBtn = Buttons_lib_name(nameField)
                            widget.value_Btn_widget_layout.addWidget(widget.newBtn)

                            widget.newBtn.itClickedName.connect(widget.receiveSignal)

                            print("Add Button [{}] in Category [{}]".format(nameField, CategoryinBox))

        elif Category:
            Count = self.scroll_layout.count()
            listWidget = []
            for i in range(Count):
                item = self.scroll_layout.itemAt(i)
                widgetName = item.widget().objectName()
                listWidget.append(widgetName)

            if nameField:
                if nameField in listWidget:
                    print("This category name [{}] exists".format(nameField))

                else:

                    self.newCategory = FieldScrollArea(nameField)
                    self.scroll_layout.addWidget(self.newCategory)
                    self.newCategory.itClickedName.connect(self.receiveSignal)
                    self.newCategory.itMoveLeftRight.connect(self.CategoryMoveLeftRight)
                    self.newCategory.itUpdateCatagory.connect(self.Update_Catagory)
                    self.newCategory.itDeleteCategory.connect(self.Update_deleteCatagory)

                    self.add_category.addItem(nameField)

                    print("New Category [{}]".format(nameField))

                    if (Count+1) >= 3:
                        SizeWidth = 60 * (Count+1)
                        self.setMaximumWidth(SizeWidth)




        # print("Name {}, Buttons {}, Category {}, Category in box {}".format(nameField,Buttons,Category,CategoryinBox))

    def Update_deleteCatagory(self, text):

        Count = self.scroll_layout.count()

        for i in range(Count):
            item = self.scroll_layout.itemAt(i)
            widget = item.widget()

            if widget.objectName() == text:
                self.add_category.removeItem(i)
                break

        if (Count -1) >= 3:
            SizeWidth = 60 * (Count -1)
            self.setMaximumWidth(SizeWidth)
        elif (Count -1) < 3:
            self.setMaximumWidth(180)

    def Update_Catagory(self):

        Count = self.scroll_layout.count()
        listCategory = []

        for i in range(Count):
            item = self.scroll_layout.itemAt(i)
            widget = item.widget()
            listCategory.append(widget.objectName())


        self.add_category.clear()

        for i in listCategory:
            self.add_category.addItem(i)

    def CategoryMoveLeftRight(self, text, pos):
        if pos == "left":
            moveWidget = -1
        elif pos == "Right":
            moveWidget = 1

        Count =  self.scroll_layout.count()

        for i in range(Count):
            item = self.scroll_layout.itemAt(i)
            widget = item.widget()

            if widget.objectName() == text:
                index = i + moveWidget
                if index == Count:
                    index = 0

                self.scroll_layout.insertWidget(index, widget)
                break

        self.Update_Catagory()

    def receiveSignal(self, text):
        self.itClickedName.emit(text)
# MayaQWidgetDockableMixin, QtWidgets.QDockWidget
class MSL_RenameTool(MayaQWidgetBaseMixin, QtWidgets.QDialog):

    def __init__(self):
        super(MSL_RenameTool, self).__init__()

        self.setObjectName("MSL_RenameToolID")
        self.setWindowTitle('MSL Rename Tool')
        self.setFixedSize(268, 165)
        # self.setWindowIcon(QtGui.QIcon(os.path.join(root_, "icons/tool.svg")))

        self.main_layout = QtWidgets.QVBoxLayout()
        self.main_layout.setAlignment(QtCore.Qt.AlignTop)
        self.main_layout.setContentsMargins(2, 2, 2, 2)
        self.main_layout.setSpacing(2)
        self.setLayout(self.main_layout)

        self.menuUI()
        self.setupUI()


        self.json_data = get_json_data()

    def setupUI(self):

        self.state_prefix_suffix = self.Edit_menu_prefix_suffix.isChecked()
        self.Start_index_Number = 1
        self.maxRange = 0
        self.minRange = 0
        self.oldTextLine = ""
        self.cursor_pos = 0
        self.old_prefix = ""
        self.old_suffix = ""
        self.NumberText = None

        # creat contents bars
        fixHeigt = 25

        # 1. Rename content
        self.Rename_content_frame  = QtWidgets.QFrame()
        self.Rename_content_frame.setFixedHeight(fixHeigt)
        self.Rename_content_frame.setFrameShape(QtWidgets.QFrame.NoFrame)

        self.Rename_content_layout = QtWidgets.QHBoxLayout(self.Rename_content_frame)
        self.Rename_content_layout.setContentsMargins(0, 0, 0, 0)
        self.Rename_content_layout.setSpacing(2)
        self.SetupUI_Rename_content()

        # 2. Number content
        self.Number_content_frame = QtWidgets.QFrame()
        self.Number_content_frame.setFixedHeight(fixHeigt)
        self.Number_content_frame.setFrameShape(QtWidgets.QFrame.NoFrame)

        self.Number_content_layout = QtWidgets.QHBoxLayout(self.Number_content_frame)
        self.Number_content_layout.setContentsMargins(0, 0, 0, 0)
        self.Number_content_layout.setSpacing(2)
        self.SetupUI_Number_content()
        number_start    = self.number_start.value()
        padding         = self.number_padding.value()
        newNumber       = ("0" * (padding - len(str(number_start)))) + str(number_start)
        self.NumberText = newNumber

        # 3. Prefix Suffix content
        self.PreSuf_content_frame = QtWidgets.QFrame()
        self.PreSuf_content_frame.setFixedHeight(fixHeigt)
        self.PreSuf_content_frame.setFrameShape(QtWidgets.QFrame.NoFrame)

        self.PreSuf_content_layout = QtWidgets.QHBoxLayout(self.PreSuf_content_frame)
        self.PreSuf_content_layout.setContentsMargins(0, 0, 0, 0)
        self.PreSuf_content_layout.setSpacing(2)
        self.SetupUI_PreSuf_content()

        # 4. List Name content
        self.listName_content_frame = QtWidgets.QFrame()
        self.listName_content_frame.setFixedHeight(fixHeigt+5)
        self.listName_content_frame.setFrameShape(QtWidgets.QFrame.NoFrame)

        self.listName_content_layout = QtWidgets.QHBoxLayout(self.listName_content_frame)
        self.listName_content_layout.setContentsMargins(0, 0, 0, 0)
        self.listName_content_layout.setSpacing(2)
        self.SetupUI_ListName_content()

        # 5. Search Replace content
        self.SearchReplace_content_frame = QtWidgets.QFrame()
        self.SearchReplace_content_frame.setFixedHeight(fixHeigt)
        self.SearchReplace_content_frame.setFrameShape(QtWidgets.QFrame.NoFrame)

        self.SearchReplace_content_layout = QtWidgets.QHBoxLayout(self.SearchReplace_content_frame)
        self.SearchReplace_content_layout.setContentsMargins(0, 0, 0, 0)
        self.SearchReplace_content_layout.setSpacing(2)
        self.SetupUI_SearchReplace_content()

        # add Widget
        self.main_layout.addWidget(self.Rename_content_frame)
        self.main_layout.addWidget(self.Number_content_frame)
        self.main_layout.addWidget(self.PreSuf_content_frame)
        self.main_layout.addWidget(self.listName_content_frame)
        self.main_layout.addWidget(self.SearchReplace_content_frame)

    def SetupUI_Rename_content(self):

        self.remove_start_btn = QtWidgets.QPushButton()
        self.remove_start_btn.setIcon(QtGui.QIcon(os.path.join(root_, "icons/arrow-right.svg")))
        self.remove_start_btn.setFixedWidth(25)

        self.remove_end_btn = QtWidgets.QPushButton()
        self.remove_end_btn.setIcon(QtGui.QIcon(os.path.join(root_, "icons/arrow-left.svg")))
        self.remove_end_btn.setFixedWidth(25)

        self.lineEdit_rename = DropLineEdit("Name")
        self.lineEdit_rename.setMaximumWidth(200)

        self.Rename_btn = Rename_BTN()
        self.Rename_btn.isEmitStateRename.connect(self.EmitStateRename)

        self.remove_start_btn.clicked.connect(self.remove_First_index)
        self.remove_end_btn.clicked.connect(self.remove_Last_index)
        self.lineEdit_rename.itDropName.connect(self.text_edited)
        self.lineEdit_rename.cursorPositionChanged.connect(self.posNumber_cursor)
        self.lineEdit_rename.returnPressed.connect(self.slidLineEdit)
        self.lineEdit_rename.textEdited.connect(self.text_edited)
        self.Rename_btn.clicked.connect(self.Set_ReName)

        self.Rename_content_layout.addWidget(self.remove_start_btn)
        self.Rename_content_layout.addWidget(self.remove_end_btn)
        self.Rename_content_layout.addWidget(self.lineEdit_rename)
        self.Rename_content_layout.addWidget(self.Rename_btn)

    def SetupUI_Number_content(self):

        self.AnimCheckBox = QtWidgets.QCheckBox()
        self.AnimCheckBox.setFixedWidth(13)
        # self.AnimCheckBox.setChecked(True)

        self.number_start = QtWidgets.QSpinBox()
        self.number_start.setPrefix("Start: ")
        self.number_start.setValue(1)
        self.number_start.setRange(0, 100)
        self.number_start.setFixedSize(68, 25)
        self.number_start.setReadOnly(True)

        self.number_padding = QtWidgets.QSpinBox()
        self.number_padding.setPrefix("Pad: ")
        self.number_padding.setValue(2)
        self.number_padding.setRange(1, 9)
        self.number_padding.setFixedSize(65, 25)
        self.number_padding.setReadOnly(True)

        self.index_slider = QtWidgets.QSlider()
        self.index_slider.setOrientation(QtCore.Qt.Horizontal)
        self.index_slider.setMaximumWidth(100)
        self.index_slider.setRange(0, self.maxRange)
        self.index_slider.setVisible(0)


        self.index_SpinBox = QtWidgets.QSpinBox()
        self.index_SpinBox.setFixedSize(40,25)
        self.index_SpinBox.setRange(self.index_slider.minimum(), self.index_slider.maximum())
        self.index_SpinBox.setReadOnly(True)

        self.number_start.valueChanged.connect(self.set_number_text)
        self.number_padding.valueChanged.connect(self.set_number_text)
        self.index_slider.sliderMoved.connect(self.slider_move_text)
        self.index_SpinBox.valueChanged.connect(self.spinBox_value)
        self.AnimCheckBox.toggled.connect(self.state_number)

        self.Number_content_layout.addWidget(self.AnimCheckBox)
        self.Number_content_layout.addWidget(self.number_start)
        self.Number_content_layout.addWidget(self.number_padding)
        self.Number_content_layout.addWidget(self.index_slider)
        self.Number_content_layout.addWidget(self.index_SpinBox)

        self.Number_content_layout.setAlignment(QtCore.Qt.AlignLeft)

    def SetupUI_PreSuf_content(self):

        self.state_prefix_suffix_CheckBox = QtWidgets.QCheckBox()
        self.state_prefix_suffix_CheckBox.setFixedWidth(13)
        # self.state_prefix_suffix_CheckBox.setChecked(True)
        self.state_prefix_suffix_CheckBox.setVisible(1)
        self.state_prefix_suffix_CheckBox.toggled.connect(self.get_state_prefix_suffix)

        self.prefix_add_btn = QtWidgets.QPushButton()
        self.prefix_add_btn.setIcon(QtGui.QIcon(os.path.join(root_, "icons/plus.svg")))
        self.prefix_add_btn.setFixedWidth(25)
        self.prefix_add_btn.clicked.connect(self.prefix_add)

        self.prefix_Editline = DropLineEdit("prefix_")
        self.prefix_Editline.setFixedWidth(97)
        self.prefix_Editline.itDropName.connect(self.prefix_suffix_edited)
        self.prefix_Editline.textEdited.connect(self.prefix_suffix_edited)

        self.suffix_Editline = DropLineEdit("_suffix")
        self.suffix_Editline.setFixedWidth(97)
        self.suffix_Editline.itDropName.connect(self.prefix_suffix_edited)
        self.suffix_Editline.textEdited.connect(self.prefix_suffix_edited)

        self.suffix_add_btn = QtWidgets.QPushButton()
        self.suffix_add_btn.setIcon(QtGui.QIcon(os.path.join(root_, "icons/plus.svg")))
        self.suffix_add_btn.setFixedWidth(25)
        self.suffix_add_btn.clicked.connect(self.suffix_add)

        self.PreSuf_content_layout.addWidget(self.state_prefix_suffix_CheckBox)
        self.PreSuf_content_layout.addWidget(self.prefix_add_btn)
        self.PreSuf_content_layout.addWidget(self.prefix_Editline)
        self.PreSuf_content_layout.addWidget(self.suffix_Editline)
        self.PreSuf_content_layout.addWidget(self.suffix_add_btn)

    def SetupUI_ListName_content(self):

        self.CheckBox_btn_in_text = QtWidgets.QCheckBox()
        self.CheckBox_btn_in_text.setChecked(False)
        self.CheckBox_btn_in_text.setFixedWidth(13)
        self.CheckBox_btn_in_text.setVisible(1)
        self.CheckBox_btn_in_text.toggled.connect(self.in_text_field)

        self.scroll_area_list_content_BTN = MyScrollArea(key="fast_access")
        self.scroll_area_list_content_BTN.setFixedWidth(250)
        self.scroll_area_list_content_BTN.itClickedName.connect(self.receiveSignal)

        self.listName_content_layout.addWidget(self.CheckBox_btn_in_text)
        self.listName_content_layout.addWidget(self.scroll_area_list_content_BTN)

    def SetupUI_SearchReplace_content(self):

        self.Search_and_Replace_checkbox = QtWidgets.QCheckBox()
        self.Search_and_Replace_checkbox.setFixedWidth(13)
        self.Search_and_Replace_checkbox.setVisible(1)
        self.Search_and_Replace_checkbox.toggled.connect(self.emitSelandReplace)


        self.search_BTN = Search_BTN()
        self.search_BTN.isEmitState.connect(self.emitState_Search_Replace)
        self.search_BTN.clicked.connect(self.Search)

        self.search_Field = DropLineEdit("Search")
        self.search_Field.setFixedWidth(97)

        self.replace_Field = DropLineEdit("Replace")
        self.replace_Field.setFixedWidth(97)

        self.replace_BTN = Replace_BTN()
        self.replace_BTN.isEmitState.connect(self.emitState_Search_Replace)
        self.replace_BTN.clicked.connect(self.Replace)

        self.SearchReplace_content_layout.addWidget(self.Search_and_Replace_checkbox)
        self.SearchReplace_content_layout.addWidget(self.search_BTN)
        self.SearchReplace_content_layout.addWidget(self.search_Field)
        self.SearchReplace_content_layout.addWidget(self.replace_Field)
        self.SearchReplace_content_layout.addWidget(self.replace_BTN)

    def menuUI(self):

        self.menuBar = QtWidgets.QMenuBar()
        self.main_layout.setMenuBar(self.menuBar)
        #  MENU Edit
        self.Edit_menu = self.menuBar.addMenu(QtGui.QIcon(os.path.join(root_, "icons/tool.svg")),"Edit")
        self.Edit_menu.setTearOffEnabled(True)

        # Save
        self.Edit_menu_Save = QtWidgets.QAction("Save", self)
        self.Edit_menu.addAction(self.Edit_menu_Save)
        self.Edit_menu_Save.triggered.connect(self.Save)
        # Reset
        self.Edit_menu_Reset = QtWidgets.QAction("Reset", self)
        self.Edit_menu.addAction(self.Edit_menu_Reset)
        self.Edit_menu_Reset.triggered.connect(self.Reset)

        # Separator objects
        self.separator_object = QtWidgets.QAction("Objects", self)
        self.separator_object.setSeparator(True)
        self.Edit_menu.addAction(self.separator_object)

        # name input
        self.Edit_menu_sub_Name_input = self.Edit_menu.addMenu("Name input")
        self.Edit_menu_sub_Name_input.setTearOffEnabled(True)

        # prefix suffix toggle
        self.Edit_menu_prefix_suffix = QtWidgets.QAction("prefix suffix in text field", self)
        self.Edit_menu_prefix_suffix.setCheckable(True)
        self.Edit_menu_sub_Name_input.addAction(self.Edit_menu_prefix_suffix)
        self.Edit_menu_prefix_suffix.triggered.connect(self.Pref_Suf_State)

        # Separator Buttons
        self.separator_Buttons = QtWidgets.QAction("Buttons", self)
        self.separator_Buttons.setSeparator(True)
        self.separator_Buttons.priority()
        self.Edit_menu_sub_Name_input.addAction(self.separator_Buttons)

        # in Text
        self.Edit_menu_InText_sub = QtWidgets.QAction("in text field", self)
        self.Edit_menu_InText_sub.setCheckable(True)

        self.Edit_menu_sub_Name_input.addAction(self.Edit_menu_InText_sub)
        self.Edit_menu_InText_sub.triggered.connect(self.State_in_text_field)

        # in Selection object
        self.Edit_menu_Object_sub = QtWidgets.QAction("in Selected object", self)
        self.Edit_menu_Object_sub.setCheckable(True)
        self.Edit_menu_Object_sub.setChecked(True)
        self.Edit_menu_sub_Name_input.addAction(self.Edit_menu_Object_sub)
        self.Edit_menu_Object_sub.triggered.connect(self.State_in_Selected_object)

        self.action_group_Buttons = QtWidgets.QActionGroup(self)

        self.action_group_Buttons.addAction(self.Edit_menu_InText_sub)
        self.action_group_Buttons.addAction(self.Edit_menu_Object_sub)

        # seprator
        self.Edit_menu_sub_Name_input.addSeparator()

        # Number toggle
        self.Edit_menu_Number = QtWidgets.QAction("Number", self)
        self.Edit_menu_sub_Name_input.addAction(self.Edit_menu_Number)
        self.Edit_menu_Number.setCheckable(True)
        # self.Edit_menu_Number.setChecked(True)
        self.Edit_menu_Number.triggered.connect(self.Number_state)

        # Search and Replace
        self.Edit_menu_sub_Search_and_Replace = self.Edit_menu.addMenu("Search and Replace")
        # self.Edit_menu_sub_Search_and_Replace.setTearOffEnabled(True)

        self.Edit_sub_S_and_R_Sel = QtWidgets.QAction("Selected", self)
        self.Edit_menu_sub_Search_and_Replace.addAction(self.Edit_sub_S_and_R_Sel)
        self.Edit_sub_S_and_R_Sel.setCheckable(True)
        self.Edit_sub_S_and_R_Sel.setChecked(True)
        self.Edit_sub_S_and_R_Sel.triggered.connect(self.emitSearchSelected)

        self.Edit_sub_S_and_R_Hi = QtWidgets.QAction("Hierarchy", self)
        self.Edit_menu_sub_Search_and_Replace.addAction(self.Edit_sub_S_and_R_Hi)
        self.Edit_sub_S_and_R_Hi.setCheckable(True)
        self.Edit_sub_S_and_R_Hi.triggered.connect(self.emitSearchHierarchy)

        self.Edit_sub_S_and_R_All = QtWidgets.QAction("All", self)
        self.Edit_menu_sub_Search_and_Replace.addAction(self.Edit_sub_S_and_R_All)
        self.Edit_sub_S_and_R_All.setCheckable(True)
        self.Edit_sub_S_and_R_All.triggered.connect(self.emitSearchAll)

        self.action_group_Search_and_Replace = QtWidgets.QActionGroup(self)

        self.action_group_Search_and_Replace.addAction(self.Edit_sub_S_and_R_Sel)
        self.action_group_Search_and_Replace.addAction(self.Edit_sub_S_and_R_Hi)
        self.action_group_Search_and_Replace.addAction(self.Edit_sub_S_and_R_All)

        #  Help
        self.Edit_menu.addSeparator()

        self.Help_menu = self.Edit_menu.addMenu("Help")
        # self.Help_menu.setTearOffEnabled(True)

        # info
        self.Help_menu_Info = QtWidgets.QAction("Info", self)
        self.Help_menu.addAction(self.Help_menu_Info)

        # Lib Name
        self.LibName_menu_Act = QtWidgets.QAction(QtGui.QIcon(QtGui.QIcon(os.path.join(root_, "icons/book.svg"))), "Book", self)
        self.LibName_menu = self.menuBar.addAction(self.LibName_menu_Act)
        self.LibName_menu_Act.setCheckable(True)
        self.LibName_menu_Act.toggled.connect(self.libNameUI)

    def Save(self):

        Count = self.scroll_area_list_content_BTN.scroll_area_widget_layout.count()
        Value = []
        for i in range(Count):
            Widgwt = self.scroll_area_list_content_BTN.scroll_area_widget_layout.itemAt(i).widget()
            Widgwt_Name = Widgwt.objectName()
            if Widgwt_Name == "Separator":
                continue
            Value.append(Widgwt_Name)

        self.json_data["fast_access"] = Value

        set_json_data(self.json_data)
        print("Save")

    def Reset(self):

        self.json_data["fast_access"] = self.json_data["fast_accessDefault"]

        set_json_data(self.json_data)

        Count = self.scroll_area_list_content_BTN.scroll_area_widget_layout.count()
        for i in range(Count):
            Widgwt = self.scroll_area_list_content_BTN.scroll_area_widget_layout.itemAt(i).widget()
            Widgwt_Name = Widgwt.objectName()
            if Widgwt_Name == "Separator":
                continue

            Widgwt.deleteLater()
        self.scroll_area_list_content_BTN.Add_Buttons()

        print("Reset")

    def Replace(self):

        ReplaceName = self.replace_Field.text()
        ListSearchName, state, SearchName = self.get_ListLongName_Search_Replace()
        sortName = sorted(ListSearchName, key=len, reverse=True)

        if ReplaceName:
            for i in sortName:

                shortName    = self.get_short_Name(i)
                NewshortName = shortName.replace(SearchName, ReplaceName, 1)
                cmds.rename(i, NewshortName)

        print("Replace '{}' with '{}' in {} names: {}".format(SearchName, ReplaceName, len(ListSearchName), state))

    def Search(self):

        ListSearchName, state, SearchName = self.get_ListLongName_Search_Replace()

        cmds.select(ListSearchName)
        print("Search '{}' in {} names: {}".format(SearchName,len(ListSearchName),state))

    def get_ListLongName_Search_Replace(self):

        SearchName = self.search_Field.text()

        if self.Edit_sub_S_and_R_Sel.isChecked():
            state = "Selected"
            ListLongName = cmds.ls(sl=1, l=1)

        elif self.Edit_sub_S_and_R_Hi.isChecked():
            state = "Hierarchy"
            ListLong_Sel  = cmds.ls(sl=1, l=1)
            ListLong_Hi   = cmds.ls(sl=1, dag=1, l=1)
            ListLong_Hi.extend(ListLong_Sel)
            ListLongName  = set(ListLong_Hi)

        elif self.Edit_sub_S_and_R_All.isChecked():
            state = "All"
            ListLongName = cmds.ls()

        ListSearchName = []

        if SearchName:
            for i in ListLongName:
                shortName = self.get_short_Name(i)
                if SearchName in shortName:
                    ListSearchName.append(i)

        return ListSearchName, state, SearchName
    def emitSelandReplace(self, state):

        if state:
            self.emitSearchHierarchy()

        else:
            self.emitSearchSelected()

    def EmitStateRename(self, state, bool):

        if state == "Pref_Suff":
            self.Pref_Suf_State(bool)
            self.Edit_menu_prefix_suffix.setChecked(bool)

        if state == "text_field":
            self.Edit_menu_InText_sub.setChecked(bool)
            self.State_in_text_field(bool)
        if state == "Selected_object":
            self.Edit_menu_Object_sub.setChecked(bool)
            self.State_in_Selected_object(bool)

        if state == "Number":
            self.Number_state(bool)





        # def State_in_text_field(self, state):
        #     self.isEmitStateRename.emit("text_field")
        #
        # def State_in_Selected_object(self, state):
        #     self.isEmitStateRename.emit("Selected_object")
        #
        # def Number_state(self, state):
        #     self.isEmitStateRename.emit("Selected_object")

    def emitState_Search_Replace(self, state):

        if state == "Selected":
            self.emitSearchSelected()

        elif state == "Hierarchy":
            self.emitSearchHierarchy()

        elif state == "All":
            self.emitSearchAll()
    def in_text_field(self,state):

        if state:
            self.State_in_text_field(state)
        else:
            self.State_in_Selected_object(state)

    def Set_ReName(self):

        if self.AnimCheckBox.isChecked():
            Number = self.NumberText
        else:
            Number = ""

        Name         = self.lineEdit_rename.text()

        if " " in Name:
            Name = Name.replace(" ", "_")


        HolderName   = self.lineEdit_rename.placeholderText()
        start        = self.Start_index_Number
        end          = start + len(Number)
        left_text    = Name[:start]
        right_text   = Name[end:]
        number_start = self.number_start.value()
        padding      = self.number_padding.value()
        ListLongName = cmds.ls(selection=1, long=1)

        if Name:
            if Number:
                for start, i in enumerate(ListLongName, start = number_start):

                    Number       = ("0" * (padding - len(str(start)))) + str(start)
                    NewshortName = left_text + Number+ right_text

                    NewshortName = cmds.rename(i, NewshortName)

                    ListLongName = self.retur_NewNamelongList(ListLongName, i, NewshortName)

            else:
                for index , i in enumerate(ListLongName):

                    shortName       = Name
                    NewLongName_TMP = cmds.rename(i, Name)

                    NewshortName = self.get_short_Name(NewLongName_TMP)

                    if Name != NewshortName:

                        shortName = NewshortName

                    ListLongName = self.retur_NewNamelongList(ListLongName, i, shortName)

    def get_short_Name(self, longName):
        shortName = longName.rpartition("|")[-1]
        return shortName

    def retur_NewNamelongList(self,ListLongName, longName, NewshortName):

        shortNameList     = longName.split("|")
        shortNameList[-1] = NewshortName
        NewLongName       = "|".join(shortNameList)

        for num, i in enumerate(ListLongName): #['|pSphere2', '|pSphere2|pCylinder2', '|pSphere2|pCylinder2|pSphere1',]

            i_TMP           = i + "|"  # '|pSphere2|pCylinder2|pSphere1_1|pSphere2|pCylinder2|'
            longName_TMP    = longName + "|" #'|pSphere2|pCylinder2|pSphere1|',

            if i_TMP[:len(longName_TMP)] == longName_TMP: # 0.True, i[|aaaa_|:] == |aaaa_|

                i = i.replace(longName, NewLongName, 1)

            ListLongName[num] = i

        return ListLongName

    def remove_First_index(self):

        Long_Name_sel_Obj = cmds.ls(selection=1, long=1)
        sortName = sorted(Long_Name_sel_Obj, key=len, reverse=True)

        for i in sortName:
            shortName = self.get_short_Name(i)
            if len(shortName) <= 2:
                continue

            cmds.rename(i, shortName[1:])

    def remove_Last_index(self):

        Long_Name_sel_Obj = cmds.ls(selection=1, long=1)
        sortName = sorted(Long_Name_sel_Obj, key=len, reverse=True)

        for i in sortName:
            shortName = self.get_short_Name(i)
            if len(shortName) <= 2:
                continue

            cmds.rename(i, shortName[:-1])

        # self.Rename_content_layout

    def text_edited(self, text):

        if self.state_prefix_suffix:
            prefix = self.prefix_Editline.text()
            suffix = self.suffix_Editline.text()
        else:
            prefix = ""
            suffix = ""

        if self.AnimCheckBox.isChecked():
            Number = self.NumberText
        else:
            Number = ""

        old_text      = self.oldTextLine
        start         = self.Start_index_Number
        cursor_pos    = self.cursor_pos
        Delete_number = ""
        end           = start + len(Number)
        left_text     = text[:start]
        right_text    = text[end:]
        sectionText   = text[start:end]
        items_add     = len(text) - len(old_text)
        items_removed = len(old_text) - len(text)
        self.maxRange = len(text) - len(Number) - len(suffix)
        self.minRange = len(prefix)
        right_without_suffix = old_text[end:len(old_text)- len(suffix)]



        if len(text) > len(Number) + len(prefix) + len(suffix) and old_text:



            if len(text) > len(old_text): # items_add

                self.oldTextLine = text

                if sectionText != Number or Number == "" and cursor_pos <= start: # items_add in left_text! [left_text] >|< (sectionText != [Number]) [right_text]

                    self.Start_index_Number += items_add
                    start = self.Start_index_Number
                    end = start + len(Number)
                    left_text = text[:start]
                    right_text = text[end:]

            elif len(text) < len(old_text): # items_removed

                self.oldTextLine = text

                if sectionText != Number or Number == "" and cursor_pos < start:  # items_removed in left_text! [left_text] >|< (sectionText != [Number]) [right_text]


                    self.Start_index_Number -= items_removed
                    start                    = self.Start_index_Number
                    end                      = start + len(Number)
                    left_text                = text[:start]
                    right_text               = text[end:]
                    sectionText              = text[start:end]


                    if start < 0 + len(prefix) and 0 + len(prefix)  != cursor_pos :    #  start cannot to be negative  |  [-1][number]|[right_text]

                        Delete_number = "Delete number, left negative"

                        start = 0 + len(prefix)
                        end = start + len(Number)

                        left_text = old_text[:start]
                        right_text = old_text[end:]
                        sectionText = old_text[start:end]

                        self.maxRange =  len(old_text) - len(Number) - len(suffix)

                        self.lineEdit_rename.setText(old_text)
                        self.lineEdit_rename.setCursorPosition(end)

                    elif prefix != text[:len(prefix)]:

                        Delete_number = "Delete prefix, left negative"

                        self.Start_index_Number += items_removed
                        start = self.Start_index_Number
                        end = start + len(Number)

                        left_text = old_text[:start]
                        right_text = old_text[end:]
                        sectionText = old_text[start:end]

                        self.lineEdit_rename.setText(old_text)
                        self.lineEdit_rename.setCursorPosition(len(prefix))
                        self.maxRange = len(old_text) - len(Number) - len(suffix)

                    elif right_without_suffix == "" and sectionText != Number and start+1 == cursor_pos :    #  end cannot to be negative  |  [number]|[][_suffix]

                        Delete_number = "Delete number, right negative"

                        self.Start_index_Number += items_removed
                        start = self.Start_index_Number
                        end = start + len(Number)

                        left_text = old_text[:start]
                        right_text = old_text[end:]
                        sectionText = old_text[start:end]

                        self.maxRange = len(old_text) - len(Number) - len(suffix)
                        self.lineEdit_rename.setText(old_text)
                        self.lineEdit_rename.setCursorPosition(cursor_pos)
                        right_without_suffix = "Delete number, right negative"

                    if sectionText != Number:   # [Text]DEL====>[Number]<===DEL[Text] Delet Number!

                        self.Start_index_Number += items_removed
                        start = self.Start_index_Number
                        end = start + len(Number)

                        if  start == cursor_pos : # [Text]>>DEL>>|[Number][(T)ext] Delet Number!

                            Delete_number = "Delete number , right"
                            left_text  = old_text[:start]
                            right_text = old_text[end + items_removed:]
                            NewText    = left_text + Number + right_text

                            self.lineEdit_rename.setText(NewText)
                            self.lineEdit_rename.setCursorPosition(start)
                            self.oldTextLine = NewText

                            if right_text == "":
                                self.maxRange = len(NewText) - len(Number)

                        else: # self.End_index_number <= self.cursor_pos: # [Tex(t)][Number]|<<<DEL<<<[Text] Delet Number!

                            self.Start_index_Number -= items_removed
                            Delete_number = "Delete number, left"

                            left_text  = old_text[:start - items_removed]
                            right_text = old_text[end:]
                            NewText    = left_text + Number + right_text

                            start = self.Start_index_Number
                            end = start + len(Number)

                            self.lineEdit_rename.setText(NewText)
                            self.lineEdit_rename.setCursorPosition(end)
                            self.oldTextLine = NewText

                    else:

                        if self.Start_index_Number <= 0 + len(prefix): #  start cannot be negative  |  [-1][number]|[right_text]
                            self.Start_index_Number = 0 + len(prefix)
                            self.oldTextLine = old_text
                        elif cursor_pos == len(prefix) and prefix != text[:len(prefix)]:

                            self.oldTextLine = old_text

                        elif right_without_suffix == "Delete number, right negative":
                            self.oldTextLine = old_text

                        else:
                            self.oldTextLine = text

                elif suffix != text[len(text) - len(suffix):]:

                    Delete_number = "Delete suffix, right negative"

                    self.maxRange = len(old_text) - len(Number) - len(suffix)

                    self.lineEdit_rename.setText(old_text)
                    self.lineEdit_rename.setCursorPosition(cursor_pos)

                    self.oldTextLine = old_text

        else:

            if  len(text) == len(Number) + len(prefix) + len(suffix) or len(text) == 0:

                self.lineEdit_rename.setText("")
                self.oldTextLine = ""
                left_text = ""
                right_text = ""
                Number = ""
                self.maxRange = 0
                Delete_number = "removed Number"
                self.Start_index_Number = 0

            else:

                self.maxRange = len(text) + len(prefix)
                self.Start_index_Number = len(text) + len(prefix)
                start = self.Start_index_Number
                Delete_number = "add Number"
                left_text = prefix + text
                right_text = "" + suffix

                NewText = prefix + text + Number + suffix

                self.lineEdit_rename.setText(NewText)
                self.lineEdit_rename.setCursorPosition(start)

                self.oldTextLine = NewText

        left_text  = left_text[len(prefix):]
        right_text = right_text[:len(right_text)-len(suffix)]

        # print("[{3}][{0}][{2}][{1}][{4}] Range = {5} {6}".format(left_text, right_text, Number, prefix, suffix, self.maxRange,Delete_number))

        self.index_slider.setRange(self.minRange, self.maxRange)
        self.index_SpinBox.setRange(self.index_slider.minimum(), self.index_slider.maximum())

        self.index_slider.setValue(self.Start_index_Number)
        self.index_SpinBox.setValue(self.Start_index_Number)

    def slidLineEdit(self):
        self.Set_ReName()

    def set_number_text(self):

        if self.AnimCheckBox.isChecked():
            Number = self.NumberText
        else:
            Number = ""

        text          = self.lineEdit_rename.text()
        old_text      = self.oldTextLine
        start         = self.Start_index_Number
        end           = start + len(Number)
        left_text     = old_text[:start]
        right_text    = old_text[end:]
        Delete_number = "Edit Number"
        padding       = self.number_padding.value()

        self.number_start.setRange(0, (pow(10, padding)) )

        number_start  = self.number_start.value()

        Number = ("0" * (padding - len(str(number_start)))) + str(number_start)

        if text:

            NewText = left_text + Number + right_text

            self.lineEdit_rename.setText(NewText)
            self.lineEdit_rename.setCursorPosition(start)

            self.oldTextLine = NewText

        self.NumberText = Number

        # print("[{0}][{2}][{1}] Range = {3} {4}".format(left_text, right_text, Number, self.maxRange, Delete_number))

    def posNumber_cursor(self,oldPos,newPos):


        MineDataName = self.lineEdit_rename.oldMineData
        name = self.lineEdit_rename.text()

        if name != MineDataName:

            if self.AnimCheckBox.isChecked():
                Number = self.NumberText
            else:
                Number = ""

            if self.state_prefix_suffix:
                prefix = self.prefix_Editline.text()
                suffix = self.suffix_Editline.text()
            else:
                prefix = ""
                suffix = ""

            self.cursor_pos = newPos

            start           = self.Start_index_Number
            end             = start + len(Number)


            if MineDataName:
                # print(MineDataName)
                if MineDataName in name:
                    # print(name)
                    SplitName = name.split(MineDataName)
                    name = SplitName[0] + SplitName[1]


            if newPos in range(start + 1, end):
                if oldPos >= end:

                    self.lineEdit_rename.setCursorPosition(start)

                elif oldPos <= self.Start_index_Number:

                    self.lineEdit_rename.setCursorPosition(end)
                # print("number")

            if prefix:
                if newPos in range(0, len(prefix)):
                    self.lineEdit_rename.setCursorPosition(len(prefix))
                    # print("prefix")

            if suffix:

                no_suffix = len(name) - len(suffix)

                if newPos in range(no_suffix +1, len(name)) or newPos >= len(name) :
                    self.lineEdit_rename.setCursorPosition(no_suffix)
                    # print("suffix")

    def slider_move_text(self, value):
        self.index_SpinBox.setValue(value)

    def spinBox_value(self, value):
        value_slider = self.index_slider.value()

        if value_slider!= value:

            text       = self.lineEdit_rename.text()
            Number     = self.NumberText
            start      = self.Start_index_Number
            end        = start + len(Number)
            left_text  = text[:start]
            right_text = text[end:]

            # delete number in text: [left_text][right_text]  del [Number]
            New_Text  = left_text + right_text

            # Move number in text: [left_text][Number][right_text]
            number_move = New_Text[:value] + Number + New_Text[value:]
            self.lineEdit_rename.setText(number_move)

            # Save value
            self.oldTextLine = number_move
            self.Start_index_Number = value
            self.lineEdit_rename.setCursorPosition(value)

            # print("[{0}][{2}][{1}] value = {3}".format(New_Text[:value], New_Text[value:],Number, value))

        self.index_slider.setValue(value)

    def state_number(self, state):


        self.Edit_menu_Number.setChecked(state)
        self.Rename_btn.popMenu_Number.setChecked(state)

        Number      = self.NumberText
        name        = self.lineEdit_rename.text()
        start       = self.Start_index_Number
        end         = start + len(Number)
        left_text   = name[:start]
        right_text  = name[end:]
        sectionText = name[start:end]
        cursor_pos  = self.cursor_pos

        if state:
            self.number_start.setReadOnly(False)
            self.number_padding.setReadOnly(False)
            self.index_SpinBox.setReadOnly(False)
            self.index_slider.setVisible(True)

            if cursor_pos in range(start,len(name)+1):
                cursor_pos += len(Number)
                # print("+",cursor_pos)


            right_text = name[start:]
            name_number = left_text + Number + right_text

            if name:

                self.lineEdit_rename.setText(name_number)
                self.lineEdit_rename.setCursorPosition(cursor_pos)

                self.oldTextLine = name_number

        else:
            self.number_start.setReadOnly(True)
            self.number_padding.setReadOnly(True)
            self.index_SpinBox.setReadOnly(True)
            self.index_slider.setVisible(False)

            if cursor_pos in range(end,len(name) +1):
                cursor_pos -= len(Number)
                # print("-",cursor_pos)

            name_no_number = left_text + right_text

            if name:

                self.lineEdit_rename.setText(name_no_number)
                self.lineEdit_rename.setCursorPosition(cursor_pos)

                self.oldTextLine = name_no_number

        # Height = self.Number_content_frame.height()
        #
        # if self.AnimCheckBox.isChecked():
        #
        #     new_Height = 30
        # else:
        #
        #     new_Height = 0
        #
        # self.animation = QtCore.QPropertyAnimation(self.Number_content_frame, b"maximumHeight")
        # self.animation.setDuration(150)
        # self.animation.setStartValue(Height)
        # self.animation.setEndValue(new_Height)
        # self.animation.start()

    def prefix_suffix_edited(self, text):

        name          = self.lineEdit_rename.text()
        prefix        = self.prefix_Editline.text()
        suffix        = self.suffix_Editline.text()
        old_prefix    = self.old_prefix
        old_suffix    = self.old_suffix

        items_add     = len(prefix) - len(old_prefix)
        items_removed = len(old_prefix) - len(prefix)

        if prefix != "" and prefix[-1] != "_" and text != "":

            len_prefix  = len(prefix)
            prefix = prefix + "_"
            self.prefix_Editline.setText(prefix)
            self.prefix_Editline.setCursorPosition(len_prefix)
            if self.state_prefix_suffix:
                self.Start_index_Number += 1
                self.maxRange += 1

        # print(self.Start_index_Number)

        if suffix != "" and suffix[0] != "_" and text != "":

            suffix = "_" + suffix
            self.suffix_Editline.setText(suffix)

        if self.state_prefix_suffix:

            if len(prefix) > len(old_prefix):
                self.Start_index_Number += items_add
                self.maxRange           += items_add
                # print(self.Start_index_Number)

            elif len(prefix) < len(old_prefix):
                self.Start_index_Number -= items_removed
                self.maxRange           -= items_removed

            if old_prefix or old_suffix:

                no_prefix = len(old_prefix)
                no_suffix = len(name) - len(old_suffix)

                name = name[no_prefix:no_suffix]

            prefix_name_suffix = prefix + name + suffix



            if self.lineEdit_rename.text():

                self.lineEdit_rename.setText(prefix_name_suffix)
                self.oldTextLine = prefix_name_suffix

            self.minRange = len(prefix)

        else:
            self.minRange = 0

        # print(self.Start_index_Number)

        self.old_prefix = prefix
        self.old_suffix = suffix
        # print("prefix = [{}], suffix = [{}]".format(prefix, suffix))

        self.index_slider.setRange(self.minRange, self.maxRange)
        self.index_SpinBox.setRange(self.index_slider.minimum(), self.index_slider.maximum())

        self.index_slider.setValue(self.Start_index_Number)
        self.index_SpinBox.setValue(self.Start_index_Number)

    def get_state_prefix_suffix(self,state):

        self.Edit_menu_prefix_suffix.setChecked(state)
        self.Rename_btn.popMenu_PrefSuf.setChecked(state)

        name         = self.lineEdit_rename.text()
        prefix       = self.prefix_Editline.text()
        suffix       = self.suffix_Editline.text()
        cursor_pos   = self.cursor_pos

        if state:
            self.state_prefix_suffix = True

            self.Start_index_Number += len(prefix)
            self.maxRange           += len(prefix)

            prefix_name_suffix       = prefix + name + suffix

            if self.lineEdit_rename.text():

                self.lineEdit_rename.setText(prefix_name_suffix)

                self.lineEdit_rename.setCursorPosition(cursor_pos + len(prefix))
                self.oldTextLine = prefix_name_suffix

            self.minRange = len(prefix)

        else:
            self.state_prefix_suffix = False

            self.Start_index_Number -= len(prefix)
            self.maxRange           -= len(prefix)

            if prefix or suffix :
                no_suffix = len(name) - len(suffix)
                name      = name[len(prefix):no_suffix]

                self.lineEdit_rename.setText(name)

                self.oldTextLine = name

            self.minRange = 0

        self.index_slider.setRange(self.minRange, self.maxRange)
        self.index_SpinBox.setRange(self.index_slider.minimum(), self.index_slider.maximum())

        self.index_slider.setValue(self.Start_index_Number)
        self.index_SpinBox.setValue(self.Start_index_Number)

    def prefix_add(self, text):

        if text:
            prefix = text
        else:
            prefix = self.prefix_Editline.text()
            if " " in prefix:
                prefix = prefix.replace(" ", "_")


        ListLongName      = cmds.ls(selection=1, long=1)
        sortName          = sorted(ListLongName, key=len, reverse=True)

        if prefix:
            for  i in sortName:

                shortName = self.get_short_Name(i)

                if shortName[:len(prefix)] == prefix:
                    continue

                NewshortName= prefix + shortName

                cmds.rename(i, NewshortName)

    def suffix_add(self, text):

        if text:
            suffix = text
        else:
            suffix = self.suffix_Editline.text()
            if " " in suffix:
                suffix = suffix.replace(" ", "_")

        ListLongName = cmds.ls(selection=1, long=1)
        sortName     = sorted(ListLongName, key=len, reverse=True)

        if suffix:
            for i in sortName:

                shortName = self.get_short_Name(i)

                if shortName[len(shortName) - len(suffix):] == suffix:
                    continue

                NewshortName =  shortName + suffix

                cmds.rename(i, NewshortName)

    def Pref_Suf_State(self, state):
        self.state_prefix_suffix_CheckBox.setChecked(state)
        self.Rename_btn.popMenu_PrefSuf.setChecked(state)

    def State_in_text_field(self, state):

        self.Edit_menu_Object_sub.setChecked(False)
        self.Edit_menu_InText_sub.setChecked(True)
        self.CheckBox_btn_in_text.setChecked(True)
        self.Rename_btn.popMenu_InText_sub.setChecked(True)


    def State_in_Selected_object(self, state):
        self.Edit_menu_Object_sub.setChecked(True)
        self.Edit_menu_InText_sub.setChecked(False)
        self.CheckBox_btn_in_text.setChecked(False)
        self.Rename_btn.popMenu_Object_sub.setChecked(True)


    def Number_state(self,state):
        self.AnimCheckBox.setChecked(state)

    def emitSearchSelected(self):

        self.Edit_sub_S_and_R_Sel.setChecked(True)
        self.search_BTN.popMenu_Selected.setChecked(True)
        self.replace_BTN.popMenu_Selected.setChecked(True)
        self.Search_and_Replace_checkbox.setChecked(False)

    def emitSearchHierarchy(self):
        self.Edit_sub_S_and_R_Hi.setChecked(True)
        self.search_BTN.popMenu_Hierarchy.setChecked(True)
        self.replace_BTN.popMenu_Hierarchy.setChecked(True)
        self.Search_and_Replace_checkbox.setChecked(True)

    def emitSearchAll(self):

        self.Search_and_Replace_checkbox.setChecked(False)
        self.Edit_sub_S_and_R_All.setChecked(True)
        self.search_BTN.popMenu_All.setChecked(True)
        self.replace_BTN.popMenu_All.setChecked(True)

    def libNameUI(self):
        if cmds.window("libNameID", exists=1):
            cmds.deleteUI("libNameID")

        if cmds.windowPref("libNameID", exists=1):
            cmds.windowPref("libNameID", remove=1)

        self.libName = LibraryName()
        self.libName.show()
        cmds.window("libNameID", e=1, titleBar=1, toolbox=1, )

        posX = self.geometry().left() + self.geometry().width()
        posY = self.y()
        self.libName.move(posX, posY)


        self.libName.itClickedName.connect(self.receiveSignal)

    def receiveSignal(self,text):

        if self.Edit_menu_Object_sub.isChecked():
            self.suffix_add(text)

        else:

            if self.state_prefix_suffix:
                prefix = self.prefix_Editline.text()
                suffix = self.suffix_Editline.text()
            else:
                prefix = ""
                suffix = ""

            if self.AnimCheckBox.isChecked():
                Number = self.NumberText
            else:
                Number = ""

            Name = self.lineEdit_rename.text()

            if Name:

                Name_no_Suffix = Name[:len(Name)-len(suffix)]
                NewName = Name_no_Suffix + text + suffix

            else:

                NewName = text

            self.lineEdit_rename.setText(NewName)
            NameEdit = self.lineEdit_rename.text()
            self.text_edited(NameEdit)

def get_json_data():
    listButtonsName_path_ = os.path.join(root_, "listButtonsName.json")
    json_data = None
    with open(listButtonsName_path_, "r") as inFile:
        json_data = json.load(inFile)

    return json_data

def set_json_data(json_data):
    listButtonsName_path_ = os.path.join(root_, "listButtonsName.json")
    with open(listButtonsName_path_, "w") as outfile:
        json.dump(json_data, outfile, indent=4)

def create_gui():

    if cmds.window("MSL_RenameToolID", exists=1):
        cmds.deleteUI("MSL_RenameToolID")

    if cmds.windowPref("MSL_RenameToolID", exists=1):
        cmds.windowPref("MSL_RenameToolID", remove=1)

    if cmds.window("libNameID", exists=1):
        cmds.deleteUI("libNameID")

    if cmds.windowPref("libNameID", exists=1):
        cmds.windowPref("libNameID", remove=1)

    global Dialog
    Dialog = MSL_RenameTool()
    Dialog.show()

    cmds.window("MSL_RenameToolID", e = 1, titleBar = 1, toolbox = 1, )




