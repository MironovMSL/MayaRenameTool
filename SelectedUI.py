import maya.cmds as cmds
from PySide2 import QtWidgets, QtGui, QtCore
from maya.app.general.mayaMixin import MayaQWidgetDockableMixin, MayaQWidgetBaseMixin
import os
import sys
import json


import maya.OpenMaya as om
import maya.OpenMayaUI as mui

root_ = os.path.dirname(__file__)
typeList = ["mesh", "nurbsSurface", "nurbsCurve", "joint", "locator", "shape", "follicle",
			"transform", "camera", "baseLattice", "lattice", "clusterHandle", "indefined", "TypeAll",
			"areaLight", "ambientLight", "directionalLight", "volumeLight", "pointLight", "spotLight",
			"duplicate", "Ru", "Constraint", "skinCluster",
			"parentConstraint", "pointConstraint", "orientConstraint", "scaleConstraint", "aimConstraint",
			"poleVectorConstraint"]


class Buttons_set_name(QtWidgets.QPushButton):
	itClickedName = QtCore.Signal(list)

	def __init__(self, text="", listsel=[]):
		super(Buttons_set_name, self).__init__()

		self._text = text
		self.listsel = listsel

		self.setObjectName(self._text)

		self.setObjectName(self._text)
		self.setFixedSize(30, 25)
		self.setText(self._text)
		self.setToolTip(self._text)

		# LineEdit setVisible
		self.NameLineEdit = QtWidgets.QLineEdit()
		self.NameLineEdit.setText(self._text)
		self.NameLineEdit.setAlignment(QtCore.Qt.AlignHCenter)

		self.NameLineEdit.setVisible(0)
		self.NameLineEdit.setFixedSize(30, 25)
		self.NameLineEdit.returnPressed.connect(self.setNewMame)

		self.main_layout = QtWidgets.QVBoxLayout()
		self.main_layout.setContentsMargins(0, 0, 0, 0)
		self.main_layout.setSpacing(0)
		self.setLayout(self.main_layout)

		self.main_layout.addWidget(self.NameLineEdit)
		self.creat_context_menu()

	def setNewMame(self):

		text = self.NameLineEdit.text()
		self.setText(text)
		self.setToolTip(text)
		self.Rename_bnt()

	def enterEvent(self, event):
		self.setCursor(QtCore.Qt.PointingHandCursor)
		super(Buttons_set_name, self).enterEvent(event)

	def leaveEvent(self, event):
		self.setCursor(QtCore.Qt.ArrowCursor)
		super(Buttons_set_name, self).leaveEvent(event)

	def mouseReleaseEvent(self, event):
		self.itClickedName.emit(self.listsel)
		super(Buttons_set_name, self).mouseReleaseEvent(event)

	def mousePressEvent(self, event):

		super(Buttons_set_name, self).mousePressEvent(event)
		if event.buttons() == QtCore.Qt.RightButton:
			self.popMenu.exec_(self.mapToGlobal(event.pos()))

	def creat_context_menu(self):

		self.popMenu = QtWidgets.QMenu(self)

		self.popMenuAdd_obj = QtWidgets.QAction("Add object", self)
		self.popMenu.addAction(self.popMenuAdd_obj)
		self.popMenuAdd_obj.triggered.connect(self.Add_object)

		self.popMenuDel_obj = QtWidgets.QAction("Remove object", self)
		self.popMenu.addAction(self.popMenuDel_obj)
		self.popMenuDel_obj.triggered.connect(self.del_object)

		self.popMenuAdd = QtWidgets.QAction("Rename", self)
		self.popMenu.addAction(self.popMenuAdd)
		self.popMenuAdd.triggered.connect(self.Rename_bnt)

		self.popMenuDel = QtWidgets.QAction("Delete Set", self)
		self.popMenu.addAction(self.popMenuDel)
		self.popMenuDel.triggered.connect(self.Delete_btn)

		self.popMenuCraetSet = QtWidgets.QAction("Creat set in Outliner", self)
		self.popMenu.addAction(self.popMenuCraetSet)
		self.popMenuCraetSet.triggered.connect(self.Creat_Set)

	def Creat_Set(self):
		textname = self.text()
		select   = cmds.select(self.listsel,r=1)
		set 	 = cmds.sets(n=textname)
		cmds.select(clear=True)

	def Rename_bnt(self):
		vis = self.NameLineEdit.isVisible()
		if vis:
			self.NameLineEdit.setVisible(0)

		else:
			self.NameLineEdit.setVisible(1)
			self.NameLineEdit.setFocus()

	def Delete_btn(self):
		self.deleteLater()

	def Add_object(self):

		select = cmds.ls(sl=1, l=1)
		self.listsel.extend(select)
		self.listsel = list(set(self.listsel))

		self.itClickedName.emit(self.listsel)

	def del_object(self):

		select = cmds.ls(sl=1, l=1)
		for i in select:
			if i in self.listsel:
				self.listsel.remove(i)

		self.itClickedName.emit(self.listsel)


class Buttons_ADD(QtWidgets.QPushButton):
	itToggleBox = QtCore.Signal(bool)
	itToggleClear = QtCore.Signal()

	def __init__(self):
		super(Buttons_ADD, self).__init__()

		self.setObjectName("AddNameID")
		# self.setStyleSheet("background-color: rgba(255, 255, 50,50);")

		self.setMaximumSize(20, 30)
		self.setIcon(QtGui.QIcon(os.path.join(root_, "icons/plus.svg")))
		self.CreatContextMenu()

	def enterEvent(self, event):
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
		self.popMenu.setTitle("add setting")

		self.popMenuClear = QtWidgets.QAction("Clear", self)
		self.popMenuClear.setIcon(QtGui.QIcon(os.path.join(root_, "icons/clear.png")))
		self.popMenu.addAction(self.popMenuClear)
		self.popMenuClear.triggered.connect(self.setClear)

	def setClear(self):
		self.itToggleClear.emit()


class SetScrollArea(QtWidgets.QScrollArea):

	def __init__(self, parent=None):
		super(SetScrollArea, self).__init__(parent)

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

		self.setObjectName("SetScrollAreaid")
		self.setMinimumSize(100, 30)
		self.setFixedHeight(30)

		self.setWidgetResizable(True)
		self.setAcceptDrops(True)

		self.setFocusPolicy(QtCore.Qt.NoFocus)
		self.setFrameShape(QtWidgets.QFrame.NoFrame)
		self.setVerticalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)
		# self.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOn)

		self.scrollbar = QtWidgets.QScrollBar()
		self.scrollbar.setStyleSheet(scroll_style)
		self.setHorizontalScrollBar(self.scrollbar)

		self.scroll_area_widget = QtWidgets.QWidget()
		self.setWidget(self.scroll_area_widget)

		self.scroll_area_widget_layout = QtWidgets.QHBoxLayout(self.scroll_area_widget)
		self.scroll_area_widget_layout.setContentsMargins(0, 0, 0, 0)
		self.scroll_area_widget_layout.setSpacing(2)
		self.scroll_area_widget_layout.setAlignment(QtCore.Qt.AlignLeft)
		self.scroll_area_widget_layout.setAlignment(QtCore.Qt.AlignTop)

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

		indexX = event.pos().x() // 40

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


class ListBTN(QtWidgets.QPushButton):
	isEmitStateRename = QtCore.Signal(str, bool)

	def __init__(self, name):
		super(ListBTN, self).__init__()

		self.Style_btn = """
                                          QPushButton {
                                          background-color: rgb(70, 70, 70);
                                          border-style: outset;
                                          border-width: 1px;
                                          border-radius: 3px;
                                          border-color: beige;
                                          font: bold 14px;
                                          font: 10pt, Arial;
                                          color: rgb(255, 255, 255);}
                                          
                                          QPushButton:hover{
         
                                          background-color: rgb(80, 80, 80);}
                                          
                                          QPushButton:pressed {
                                          background-color: rgb(100, 100, 100);
                                          border-style: inset;}
                                       """

		self.setObjectName("ListBTNID")
		self.setFixedHeight(20)
		self.setText("List   [  ]")
		self.creat_context_menu()
		self.setStyleSheet(self.Style_btn)

	def set_Count(self, count):
		if count == 0:
			count = ""
		name = "List   [ {} ]".format(count)
		self.setText(name)

	def enterEvent(self, event):
		self.setCursor(QtCore.Qt.PointingHandCursor)
		super(ListBTN, self).enterEvent(event)

	def leaveEvent(self, event):
		self.setCursor(QtCore.Qt.ArrowCursor)
		super(ListBTN, self).leaveEvent(event)

	def mousePressEvent(self, event):
		super(ListBTN, self).mousePressEvent(event)

		if event.buttons() == QtCore.Qt.RightButton:
			self.popMenu.exec_(self.mapToGlobal(event.pos()))

		self.setStyleSheet(self.Style_btn)

	def creat_context_menu(self):
		self.popMenu = QtWidgets.QMenu(self)
		# self.popMenu.setTearOffEnabled(True)
		self.popMenu.setTitle("List Seting")

		# in Selected
		self.action_group_Buttons = QtWidgets.QActionGroup(self)

		self.popMenu_Selected = QtWidgets.QAction("Selected", self)
		self.popMenu_Selected.setCheckable(True)
		self.popMenu_Selected.setChecked(True)
		self.popMenu.addAction(self.popMenu_Selected)
		self.popMenu_Selected.triggered.connect(self.State_Selected)

		# in Hierarchy
		self.popMenu_Hierarchy = QtWidgets.QAction("Hierarchy", self)
		self.popMenu_Hierarchy.setCheckable(True)
		# self.popMenu_Hierarchy.setChecked(True)
		self.popMenu.addAction(self.popMenu_Hierarchy)
		self.popMenu_Hierarchy.triggered.connect(self.State_Hierarchy)

		self.action_group_Buttons.addAction(self.popMenu_Selected)
		self.action_group_Buttons.addAction(self.popMenu_Hierarchy)

	def State_Selected(self, state):
		self.isEmitStateRename.emit("Selected", state)

	def State_Hierarchy(self, state):
		self.isEmitStateRename.emit("Selected_object", state)


class ButtonType(QtWidgets.QPushButton):
	isTypeList = QtCore.Signal(list)

	def __init__(self, TypeIcon, TypeList=[]):
		super(ButtonType, self).__init__()

		self.TypeIcon = TypeIcon
		self.list = TypeList
		self.stateMenu = False
		self.skinCluster = None

		self.setObjectName(TypeIcon + "id")
		self.setFixedSize(16, 16)
		self.set_icon()
		self.setToolTip(TypeIcon)
		if TypeIcon in ["duplicate", "Ru"]:
			self.creat_context_menu()
			self.stateMenu = True

		self.set_TypeList()

	def set_TypeList(self):

		self.TypeList = self.list

		if self.stateMenu:
			if self.popMenu_Shape.isChecked():
				self.TypeList = self.list
			else:
				typeList = ["mesh", "nurbsSurface", "nurbsCurve", "locator", "follicle", "camera", "baseLattice",
							"lattice", "clusterHandle", "areaLight", "ambientLight", "directionalLight",
							"volumeLight", "pointLight", "spotLight"]

				TypeListNoShape = []

				for i in self.TypeList:
					if cmds.nodeType(i) not in typeList:
						TypeListNoShape.append(i)

				self.TypeList = TypeListNoShape

	def creat_context_menu(self):
		self.popMenu = QtWidgets.QMenu(self)
		# self.popMenu.setTearOffEnabled(True)
		self.popMenu.setTitle(self.TypeIcon)

		self.popMenu_Shape = QtWidgets.QAction("shape", self)
		self.popMenu_Shape.setCheckable(True)
		self.popMenu.addAction(self.popMenu_Shape)
		self.popMenu_Shape.triggered.connect(self.SetShape)

	def SetShape(self):
		self.set_TypeList()

		if self.popMenu_Shape.isChecked():
			self.isTypeList.emit(self.TypeList)

		else:
			self.isTypeList.emit(self.TypeList)

	def set_icon(self):
		if self.TypeIcon not in typeList and cmds.nodeType(self.TypeIcon) == "skinCluster":
			self.setIcon(QtGui.QIcon(os.path.join(root_, "icons/skinJoint.png")))
			self.skinCluster = True

		elif self.TypeIcon in typeList:
			self.setIcon(QtGui.QIcon(os.path.join(root_, "icons/{}.png".format(self.TypeIcon))))
		else:
			self.setIcon(QtGui.QIcon(os.path.join(root_, "icons/menuIconConstraints.png")))

	def mouseReleaseEvent(self, event):
		super(ButtonType, self).mouseReleaseEvent(event)
		self.isTypeList.emit(self.TypeList)

	def mousePressEvent(self, event):
		super(ButtonType, self).mousePressEvent(event)

		if self.stateMenu:
			if event.buttons() == QtCore.Qt.RightButton:
				self.popMenu.exec_(self.mapToGlobal(event.pos()))

	def enterEvent(self, event):
		self.setCursor(QtCore.Qt.PointingHandCursor)
		super(ButtonType, self).enterEvent(event)

	def leaveEvent(self, event):
		self.setCursor(QtCore.Qt.ArrowCursor)
		super(ButtonType, self).leaveEvent(event)


class ButtonSkinClusterType(QtWidgets.QPushButton):
	isTypeList = QtCore.Signal(list)

	def __init__(self, Mesh, Shape, libtSkinCluster={}):
		super(ButtonSkinClusterType, self).__init__()

		self.Mesh     	      = Mesh
		self.shortName        = self.Mesh.rpartition("|")[-1]
		self.Shape            = Shape
		self.libtSkinCluster  = libtSkinCluster
		self.skinCluster      = True
		self.TypeList         = None

		self.setObjectName(self.shortName + "SkinClusterid")
		self.setFixedSize(16, 16)
		self.setIcon(QtGui.QIcon(os.path.join(root_, "icons/skinJoint.png")))
		self.setToolTip(self.shortName + " SkinCluster")

		self.creat_context_menu()

	def creat_context_menu(self):
		self.popMenu = QtWidgets.QMenu(self)
		self.popMenu.setTearOffEnabled(True)
		self.popMenu.setTitle(self.shortName)

		self.popMenu_Selobj = QtWidgets.QAction("Select '{}'".format(self.shortName), self)
		# self.popMenu_Shape.setCheckable(True)
		self.popMenu.addAction(self.popMenu_Selobj)
		self.popMenu_Selobj.triggered.connect(self.SelMesh)

		if len(self.libtSkinCluster) > 1:
			# self.popMenu.addSeparator()
			self.separator_SkinCluster = QtWidgets.QAction("SkinCluster", self)
			self.separator_SkinCluster.setSeparator(True)
			self.separator_SkinCluster.priority()
			self.popMenu.addAction(self.separator_SkinCluster)

			self.action_group_SkinCluster = QtWidgets.QActionGroup(self)
			for enum, i in enumerate(self.libtSkinCluster.keys()):

				if enum > 0:

					popMenu = QtWidgets.QAction(i, self)
					popMenu.setCheckable(True)
					self.popMenu.addAction(popMenu)
					self.action_group_SkinCluster.addAction(popMenu)
					popMenu.triggered.connect(self.list_jointSkin)

				else:
					self.TypeList = self.libtSkinCluster[i]
					popMenu       = QtWidgets.QAction(i, self)

					popMenu.setCheckable(True)
					popMenu.setChecked(True)
					self.popMenu.addAction(popMenu)
					self.action_group_SkinCluster.addAction(popMenu)
					popMenu.triggered.connect(self.list_jointSkin)

		else:
			self.separator_SkinCluster = QtWidgets.QAction("SkinCluster", self)
			self.separator_SkinCluster.setSeparator(True)
			self.separator_SkinCluster.priority()
			self.popMenu.addAction(self.separator_SkinCluster)

			skinCluster = list(self.libtSkinCluster.keys())[0]

			self.TypeList = self.libtSkinCluster[skinCluster]
			popMenu = QtWidgets.QAction(skinCluster, self)
			self.popMenu.addAction(popMenu)
			popMenu.triggered.connect(lambda: self.list_jointSkin(count=False))




		self.popMenu.addSeparator()

		self.popMenu_ListSCluster = QtWidgets.QAction("Select SkinCluster", self)
		self.popMenu.addAction(self.popMenu_ListSCluster)
		self.popMenu_ListSCluster.triggered.connect(self.selSkinCluster)




	def selSkinCluster(self):
		self.isTypeList.emit(list(self.libtSkinCluster.keys()))
	def list_jointSkin(self, count=True):

		if count:
			skinCluster = self.action_group_SkinCluster.checkedAction().text()
			self.TypeList = self.libtSkinCluster[skinCluster]
			self.isTypeList.emit(self.TypeList)
		else:
			self.isTypeList.emit(self.TypeList)



	def SelMesh(self):
		cmds.select(self.Mesh)

	def mouseReleaseEvent(self, event):
		super(ButtonSkinClusterType, self).mouseReleaseEvent(event)
		self.isTypeList.emit(self.TypeList)

	def mousePressEvent(self, event):
		super(ButtonSkinClusterType, self).mousePressEvent(event)

		if event.buttons() == QtCore.Qt.RightButton:
			self.popMenu.exec_(self.mapToGlobal(event.pos()))

	def enterEvent(self, event):
		self.setCursor(QtCore.Qt.PointingHandCursor)
		super(ButtonSkinClusterType, self).enterEvent(event)

	def leaveEvent(self, event):
		self.setCursor(QtCore.Qt.ArrowCursor)
		super(ButtonSkinClusterType, self).leaveEvent(event)


class MSL_Selected(MayaQWidgetBaseMixin, QtWidgets.QDialog):

	def __init__(self, *args, **kwargs):
		super(MSL_Selected, self).__init__(*args, **kwargs)

		self.setMinimumSize(150, 200)
		self.resize(200, 400)
		self.setObjectName("CustomMSL_Selected")
		self.setWindowTitle("Selected")

		self.main_layout = QtWidgets.QVBoxLayout(self)
		self.main_layout.setMargin(2)
		self.main_layout.setSpacing(2)

		self.menuUI()
		self.setupUI()

		self.setupUI_set()

	# QtCore.QTimer.singleShot(1, self.set_list)

	def menuUI(self):
		self.menu = QtWidgets.QMenuBar()
		self.EditMenu = self.menu.addMenu(QtGui.QIcon(os.path.join(root_, "icons/tool.svg")), "Edit")
		# self.EditMenu.setTearOffEnabled(True)

		self.Edit_menu_duplicate = QtWidgets.QAction("duplicate name", self)
		self.Edit_menu_duplicate.setIcon(QtGui.QIcon(os.path.join(root_, "icons/duplicate.png")))
		self.EditMenu.addAction(self.Edit_menu_duplicate)
		self.Edit_menu_duplicate.triggered.connect(self.GetDuplicate)

		self.Edit_menu_Ru = QtWidgets.QAction("Ru name", self)
		self.Edit_menu_Ru.setIcon(QtGui.QIcon(os.path.join(root_, "icons/Ru.png")))
		self.EditMenu.addAction(self.Edit_menu_Ru)
		self.Edit_menu_Ru.triggered.connect(self.GetRu)

		self.Edit_menu_skinJoint = QtWidgets.QAction("Jion in skin mesh", self)
		self.Edit_menu_skinJoint.setIcon(QtGui.QIcon(os.path.join(root_, "icons/skinJoint.png")))
		self.EditMenu.addAction(self.Edit_menu_skinJoint)
		self.Edit_menu_skinJoint.triggered.connect(self.GetSkinJoint)

		self.main_layout.addWidget(self.menu)

	def setupUI(self):



		self.List_BTN = ListBTN("List")

		self.model = QtGui.QStandardItemModel()
		self.model.setItemPrototype(DagTreeItem())

		self.view = QtWidgets.QListView()
		self.view.setModel(self.model)
		# self.view.header().setVisible(False)
		self.view.setEditTriggers(self.view.DoubleClicked)
		self.view.setSelectionMode(self.view.ExtendedSelection)

		# ---------------------------------
		scroll_styleV = """QScrollBar:vertical {
		                            background: rgb(10, 10, 10);
		                            width: 5px;
		                            margin: 0px 0 0 0px;
		                            
		                        }
		                        QScrollBar::handle:vertical {
		                            border: 1px rgb(0,0,0);
		                            background: rgb(80, 80, 80);
		                        }
		                        """
		scroll_styleH = """QScrollBar:horizontal {
		                            background: rgb(10, 10, 10);
		                            height: 5px;
		                            margin: 0px 0 0 0px;
		                        }
		                        QScrollBar::handle:horizontal {
		                            border: 1px rgb(0,0,0);
		                            background: rgb(80, 80, 80);
		                        }
		                        """

		self.scrollbarV = QtWidgets.QScrollBar()
		self.scrollbarH = QtWidgets.QScrollBar()
		self.scrollbarV.setStyleSheet(scroll_styleV)
		self.scrollbarH.setStyleSheet(scroll_styleH)
		self.view.setVerticalScrollBar(self.scrollbarV)
		self.view.setHorizontalScrollBar(self.scrollbarH)
		# ------------------------------------------

		self.list_layot_main = QtWidgets.QHBoxLayout()

		self.List_view_layout = QtWidgets.QVBoxLayout()

		self.list_widgets = QtWidgets.QWidget()
		self.list_widgets.setFixedWidth(16)
		self.clear_BTN = QtWidgets.QPushButton("( )")

		self.clear_BTN.setStyleSheet("""
                                          QPushButton {
                                          background-color: rgb(70, 70, 70);
                                          border-style: outset;
                                          border-width: 1px;
                                          border-radius: 3px;
                                          border-color: beige;
                                          font: bold 14px;
                                          font: 7pt, Arial;
                                          color: rgb(255, 255, 255);}
                                          
                                          QPushButton:hover{
         
                                          background-color: rgb(80, 80, 80);}
                                          
                                          QPushButton:pressed {
                                          background-color: rgb(100, 100, 100);
                                          border-style: inset;}
                                       """)
		self.clear_BTN.setFixedSize(16, 20)
		self.clear_BTN.clicked.connect(self.clear_Widget_listType)

		self.List_Type = QtWidgets.QVBoxLayout()

		self.widget_layout = QtWidgets.QVBoxLayout(self.list_widgets)
		self.widget_layout.setMargin(0)
		self.widget_layout.setSpacing(2)
		self.widget_layout.setAlignment(QtCore.Qt.AlignTop)

		self.List_Type.addWidget(self.clear_BTN)
		self.List_Type.addWidget(self.list_widgets)

		self.List_view_layout.addWidget(self.List_BTN)
		self.List_view_layout.addWidget(self.view)

		self.list_layot_main.addLayout(self.List_view_layout)
		# self.list_layot_main.addWidget(self.list_widgets)
		self.list_layot_main.addLayout(self.List_Type)

		self.main_layout.addLayout(self.list_layot_main)

		self.List_BTN.clicked.connect(self.set_list)
		self.view.selectionModel().selectionChanged.connect(self.selectionChanged)
		self.model.itemChanged.connect(self.ChangedItems)


	def emitRenamTool(self, librname, ):

		Count      = self.widget_layout.count()
		countModel = self.model.rowCount()
		CountSet   = self.listscrollArea.scroll_area_widget_layout.count()

		if librname["listNameOld"]:
			if countModel:
				for num, oldname in enumerate(librname["listNameOld"]):
					for index in range(countModel):
						itemModel = self.model.item(index)
						namefull = itemModel.fullname

						if namefull == oldname:
							self.model.takeRow(index)
							newItem = DagTreeItem(librname["listNameNew"][num])
							self.model.insertRow(index, newItem)

							if librname["listNameShapOld"][num]:
								for indexshape in range(countModel):

									itemshape = self.model.item(indexshape)
									namefullshape = itemshape.fullname

									if namefullshape == librname["listNameShapOld"][num]:
										self.model.takeRow(indexshape)
										newItem = DagTreeItem(librname["listNameShapNew"][num])
										self.model.insertRow(indexshape, newItem)


							if Count:
								for i in range(Count):
									WidgetList = self.widget_layout.itemAt(i).widget().TypeList

									if oldname in WidgetList:
										WidgetList[WidgetList.index(oldname)] = librname["listNameNew"][num]

									if librname["listNameShapOld"][num]:
										if librname["listNameShapOld"][num] in WidgetList:
											WidgetList[WidgetList.index(librname["listNameShapOld"][num])] = librname["listNameShapNew"][num]


							if CountSet:
								for a in range(CountSet):
									WidgetList = self.listscrollArea.scroll_area_widget_layout.itemAt(a).widget().listsel

									if oldname in WidgetList:
										WidgetList[WidgetList.index(oldname)] = librname["listNameNew"][num]

									if librname["listNameShapOld"][num]:

											if librname["listNameShapOld"][num] in WidgetList:
												WidgetList[WidgetList.index(librname["listNameShapOld"][num])] = librname["listNameShapNew"][num]

	def ChangedItems(self, item):
		sel = self.view.selectedIndexes()

		oldname = self.model.itemFromIndex(sel[0]).fullname

		typeOld = cmds.nodeType(oldname)
		shapeOld = None

		if typeOld == "transform":
			shapeOld = cmds.listRelatives(oldname, shapes=1, f = 1)


		newname = cmds.rename(self.model.itemFromIndex(sel[0]).fullname, str(item.text()))
		shapeNew = cmds.listRelatives(newname, shapes=1, f=1)

		self.model.itemFromIndex(sel[0]).editName(newname)

		Count = self.widget_layout.count()
		if Count:
			for i in range(Count):
				WidgetList = self.widget_layout.itemAt(i).widget().TypeList


				if oldname in WidgetList:
					WidgetList[WidgetList.index(oldname)] = newname

				if shapeOld:
					for enum, i in enumerate(shapeOld):
						if i in WidgetList:
							WidgetList[WidgetList.index(i)] = shapeNew[enum]

		if shapeOld:
			countModel = self.model.rowCount()
			for index in range(countModel):

				iteminex = self.model.item(index)
				namefull = iteminex.fullname

				if namefull == shapeOld[0]:
					self.model.takeRow(index)
					newItem = DagTreeItem(shapeNew[0])
					self.model.insertRow(index,newItem)
					# iteminex.EditSgape(shapeNew[0])

		CountSet = self.listscrollArea.scroll_area_widget_layout.count()

		if CountSet:

			for a in range(CountSet):

				WidgetList = self.listscrollArea.scroll_area_widget_layout.itemAt(a).widget().listsel

				if oldname in WidgetList:
					WidgetList[WidgetList.index(oldname)] = newname

				if shapeOld:
					for enum, i in enumerate(shapeOld):
						if i in WidgetList:
							WidgetList[WidgetList.index(i)] = shapeNew[enum]

	def setupUI_set(self):

		self.addsetBtn = Buttons_ADD()
		self.listscrollArea = SetScrollArea()
		self.listscrollArea_layout = QtWidgets.QHBoxLayout()
		self.set_layout = QtWidgets.QHBoxLayout()

		self.addsetBtn.clicked.connect(self.addSel_list)
		self.addsetBtn.itToggleClear.connect(self.setClear)

		self.listscrollArea_layout.addWidget(self.listscrollArea)
		self.set_layout.addWidget(self.addsetBtn)
		self.set_layout.addLayout(self.listscrollArea_layout)

		self.main_layout.addLayout(self.set_layout)

	def GetSkinJoint(self):

		sel_list = cmds.ls(sl=1, l=1)

		geo = []
		geoshape = []
		libSkinCluster = {}
		libMesh = {}

		for i in sel_list:
			type = cmds.nodeType(i)

			if type == "transform":
				shape = cmds.listRelatives(i, shapes=1)

				if shape:
					shapeType = cmds.nodeType(shape[0])
					if shapeType in ["mesh","nurbsCurve","nurbsSurface"]:
						geo.append(i)
						geoshape.append(shape[0])

			elif type in ["mesh","nurbsCurve","nurbsSurface"]:
				transform = cmds.listRelatives(i, p=True)[0]
				geo.append(transform)
				geoshape.append(i)

		if geo:
			clusters = cmds.ls(type='skinCluster')

			for mesh in geo:
				libMesh[mesh] = {}

				shape = cmds.listRelatives(mesh, shapes=1)[0]
				libMesh[mesh]["shape"] = shape
				libMesh[mesh]["skinCluster"] = {}

				for i in clusters:

					geoshapeCluster = cmds.skinCluster(i, q=1, g=1)[0]

					if geoshapeCluster == shape:
						SkinJoints = cmds.skinCluster(i, q=1, wi=1)
						libMesh[mesh]["skinCluster"][i] = SkinJoints

				if not libMesh[mesh]["skinCluster"]:
					del libMesh[mesh]

				# libSkinCluster[i] = SkinJoints

			Count = self.widget_layout.count()
			if Count:
				for i in range(Count):
					Widget = self.widget_layout.itemAt(i).widget()
					WidgetName = Widget.skinCluster
					if WidgetName:
						Widget.deleteLater()

			if libMesh:
				self.model.clear()
				for a in libMesh.keys():
					btn = ButtonSkinClusterType(a, libMesh[a]["shape"], libMesh[a]["skinCluster"])
					btn.isTypeList.connect(self.viewTypelist)
					self.widget_layout.addWidget(btn)



				# self.Creat_ButtonType(libMesh)

				# class ButtonSkinClusterType(QtWidgets.QPushButton):
				# 	def __init__(self, Mesh, Shape, libtSkinCluster={}):

				# def Creat_ButtonType(self, library={}):
				#
				# 	for i in library.keys():
				# 		if library[i]:
				# 			btn = ButtonType(i, library[i])
				#
				# 			btn.isTypeList.connect(self.viewTypelist)
				# 			self.widget_layout.addWidget(btn)

				Count = self.widget_layout.count()
				if Count:
					for i in range(Count):
						Widget = self.widget_layout.itemAt(i).widget()
						WidgetName = Widget.skinCluster

						if WidgetName:
							cmds.select(Widget.TypeList, r=1)

			else:
				print("No Bind skin")

		else:
			print("Reuired selection is only one poly mesh !")

	def setClear(self):

		count = self.listscrollArea.scroll_area_widget_layout.count()
		for i in range(count):
			Widgwt = self.listscrollArea.scroll_area_widget_layout.itemAt(i).widget()
			Widgwt.deleteLater()

	def addSel_list(self):
		sel = cmds.ls(sl=1, l=1)
		if sel:
			count = self.listscrollArea.scroll_area_widget_layout.count()
			listSetBtn = Buttons_set_name("L {}".format(str(count + 1)), sel)
			self.listscrollArea.scroll_area_widget_layout.addWidget(listSetBtn)
			listSetBtn.itClickedName.connect(self.viewTypelist)

	def clear_Widget_listType(self):
		Count = self.widget_layout.count()
		if Count:
			for i in range(Count):
				Widget = self.widget_layout.itemAt(i).widget()

				Widget.deleteLater()

		self.model.clear()
		self.List_BTN.set_Count(0)

	# self.sortActions.triggered.connect(self.sortMethodChanged)
	def GetRu(self):

		ABC = get_json_data("alphabet.json")
		ListLong_Sel = cmds.ls(sl=1, l=1)
		ListLong_Hi = cmds.ls(sl=1, dag=1, l=1)
		ListLong_Hi.extend(ListLong_Sel)
		ListLongName = list(set(ListLong_Hi))

		RUList = []
		RUlib = {}
		if ListLongName:
			for i in ListLongName:
				shortName = self.get_short_Name(i)
				for a in shortName:

					if a in ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"] or a == "_":
						continue

					elif a not in ABC["EN"].keys():
						if ord(a) == ABC["RU"][a]:
							print("Name ['{}'], Ru = ['{}']".format(shortName, a))
							RUList.append(i)
							break

		RUlib["Ru"] = RUList

		Count = self.widget_layout.count()
		if Count:
			for i in range(Count):
				Widget = self.widget_layout.itemAt(i).widget()
				WidgetName = Widget.objectName()

				if WidgetName in ["Ruid"]:
					Widget.deleteLater()

		if RUList:
			self.model.clear()
			self.Creat_ButtonType(RUlib)

			Count = self.widget_layout.count()
			if Count:
				for i in range(Count):
					Widget = self.widget_layout.itemAt(i).widget()
					WidgetName = Widget.objectName()

					if WidgetName in ["Ruid"]:
						cmds.select(Widget.TypeList, r=1)

		else:

			print("No Ru Name")

	def GetDuplicate(self):

		ListLong_Sel = cmds.ls(sl=1, l=1)
		ListLong_Hi = cmds.ls(sl=1, dag=1, l=1)
		ListLong_Hi.extend(ListLong_Sel)
		ListLongName = list(set(ListLong_Hi))

		newList = []
		librLisr = {}
		for num, a in enumerate(ListLongName, start=1):
			shortName = self.get_short_Name(a)

			for i in ListLongName[num:]:
				shortName2 = self.get_short_Name(i)
				if shortName == shortName2:
					if a not in newList:
						newList.append(a)
					if i not in newList:
						newList.append(i)

		librLisr["duplicate"] = newList

		Count = self.widget_layout.count()
		if Count:
			for i in range(Count):
				Widget = self.widget_layout.itemAt(i).widget()
				WidgetName = Widget.objectName()

				if WidgetName in ["duplicateid"]:
					Widget.deleteLater()

		if newList:
			self.model.clear()

			self.Creat_ButtonType(librLisr)

			Count = self.widget_layout.count()
			if Count:
				for i in range(Count):
					Widget = self.widget_layout.itemAt(i).widget()
					WidgetName = Widget.objectName()

					if WidgetName in ["duplicateid"]:
						cmds.select(Widget.TypeList, r=1)



		else:

			print("No Duplicate Name")

	def get_short_Name(self, longName):
		shortName = longName.rpartition("|")[-1]
		return shortName

	def gettypeLists(self, Sellist=[]):

		librLisr = {}
		shapelist = []

		librLisr["TypeAll"] = list(Sellist)

		if Sellist:
			for i in Sellist:
				type = cmds.nodeType(i)

				if type == "transform":
					shape = cmds.listRelatives(i, shapes=1, f=1)

					if shape:
						shape = shape[0]
						shapeType = cmds.nodeType(shape)
						if shapeType:

							shapelist.append(shape)
							if shapeType in typeList:
								if shapeType == "baseLattice":
									shapeType = "lattice"

								elif shapeType in ["areaLight", "ambientLight", "directionalLight", "volumeLight",
												   "pointLight", "spotLight"]:

									shapeType = "ambientLight"

								if shapeType in librLisr.keys():
									librLisr[shapeType].append(i)

									librLisr["shape"].append(shape)
								else:
									librLisr[shapeType] = [i]
									librLisr["shape"] = [shape]

					else:
						if type in librLisr.keys():
							librLisr[type].append(i)
						else:
							librLisr[type] = [i]

				else:
					if type == "joint":
						if type in librLisr.keys():
							librLisr[type].append(i)
						else:
							librLisr[type] = [i]

					elif type in ["parentConstraint", "pointConstraint", "orientConstraint", "scaleConstraint",
								  "aimConstraint", "poleVectorConstraint"]:
						type = "Constraint"
						if type in librLisr.keys():
							librLisr[type].append(i)
						else:
							librLisr[type] = [i]

					elif i in shapelist:
						continue
					else:
						if type in typeList:
							shapelist.append(i)
						else:
							if "indefined" in librLisr.keys():
								librLisr["indefined"].append(i)
							else:
								librLisr["indefined"] = [i]

		librLisr["shape"] = list(set(shapelist))

		self.Creat_ButtonType(librLisr)

	def Creat_ButtonType(self, library={}):

		for i in library.keys():
			if library[i]:
				btn = ButtonType(i, library[i])

				btn.isTypeList.connect(self.viewTypelist)
				self.widget_layout.addWidget(btn)

	def viewTypelist(self, TypeList):

		self.model.clear()

		node = []
		for i in TypeList:
			item = DagTreeItem(i)
			node.append(item)

		self.model.appendColumn(node)
		cmds.select(TypeList, r=1)
		self.List_BTN.set_Count(len(TypeList))

	def set_list(self):



		Count = self.widget_layout.count()
		if Count:
			for i in range(Count):
				Widget = self.widget_layout.itemAt(i).widget()

				Widget.deleteLater()

		if self.List_BTN.popMenu_Selected.isChecked():
			ListLongName = cmds.ls(sl=1, l=1)

		elif self.List_BTN.popMenu_Hierarchy.isChecked():
			ListLong_Sel = cmds.ls(sl=1, l=1)
			ListLong_Hi = cmds.ls(sl=1, dag=1, l=1)
			ListLong_Hi.extend(ListLong_Sel)
			ListLongName = set(ListLong_Hi)

		self.gettypeLists(ListLongName)
		self.model.clear()

		node = []
		for i in ListLongName:
			item = DagTreeItem(i)
			node.append(item)

		self.model.appendColumn(node)
		self.List_BTN.set_Count(len(ListLongName))

	def nodeExpanded(self, idx):

		idx = self.sortModel.mapToSource(idx)

		item = self.model.itemFromIndex(idx)

		if item.hasChildren():
			for row in range(item.rowCount()):

				child = item.child(row)
				child.removeRows(0, child.rowCount())
				grandChildren = self.scanDag(child)
				if grandChildren:
					child.appendRows(grandChildren)

	def selectionChanged(self):

		sel = self.view.selectedIndexes()
		nodes = [self.model.itemFromIndex(i).fullname for i in sel]
		if nodes:
			if cmds.objExists(nodes[0]):
				cmds.select(nodes, replace=True)
		else:
			cmds.select(clear=True)

	def sortMethodChanged(self):
		"""
		sortMethodChanged()
		Slot called when the sort method has changed in the UI
		and the model should have it's sort mode changed.
		"""
		action = self.sortActions.checkedAction()

		if action is self.sortAction1:
			# disable sorting. will return to the original order
			# of the source model.
			self.sortModel.sort(-1)

		elif action is self.sortAction2:
			# we only have one column. sort on column 0
			self.sortModel.sort(0)


class DagTreeProxyModel(QtCore.QSortFilterProxyModel):
	DAG_TYPES = {
		'NURBS Objects': [om.MFn.kNurbsSurface, om.MFn.kNurbsCurve],
		'Polygon Objects': [om.MFn.kPolyCreator],
		'Cameras': [om.MFn.kCamera],
		'Lights': [om.MFn.kLight],
	}

	def __init__(self, *args, **kwargs):
		super(DagTreeProxyModel, self).__init__(*args, **kwargs)

		self._dag_filters = set()

	def addFilter(self, name):
		dagType = self.DAG_TYPES.get(name)
		if dagType is not None:
			self._dag_filters.update(dagType)
			self.invalidateFilter()

	def removeFilter(self, name):
		dagType = self.DAG_TYPES.get(name)
		if dagType is not None:
			self._dag_filters = self._dag_filters.difference(dagType)
			self.invalidateFilter()

	def clearFilters(self):
		self._dag_filters.clear()
		self.invalidateFilter()

	def filterAcceptsRow(self, sourceRow, sourceParent):
		model = self.sourceModel()
		idx = model.index(sourceRow, 0, sourceParent)
		item = model.itemFromIndex(idx)
		if self._dag_filters and item:
			dagObj = item.dagObj
			# print (item,)
			for dagType in self._dag_filters:
				if dagObj.hasFn(dagType):
					# print (dagType, True)
					return True
			# print (False)
			return False
		return True
# return super(DagTreeProxyModel, self).filterAcceptsRow(sourceRow, sourceParent)


class DagTreeItem(QtGui.QStandardItem):
	"""
	DagTreeItem(QtGui.QStandardItem)
	QStandardItem subclass that represents a Dag node
	"""

	def __init__(self, dagObj=None):
		super(DagTreeItem, self).__init__()

		self.dagObj = dagObj

		self.apiType = om.MFn.kInvalid
		self.shapeApiType = om.MFn.kInvalid

		self.setText(self.name)

		# self.setData(self.sortKey, QtCore.Qt.UserRole)
		# self.setData(self.EditSgape, QtCore.Qt.EditRole)


		if self.fullname:
			self.set_icon()


	def __repr__(self):
		return "<%s: %s>" % (self.__class__.__name__, self.name)

	def EditSgape(self,newnameShape):
		self.dagObj = newnameShape



	def editName(self, newname):
		self.dagObj = self.parentname + "|" + newname
		self.setText(self.name)
		return self.dagObj

	@property
	def sortKey(self):

		if self.dagObj:
			self.apiType = self.dagObj.apiType()
			print(self.apiType)
			dagCopy = om.MDagPath(self.dagObj)

			try:
				dagCopy.extendToShape()
				self.shapeApiType = dagCopy.apiType()
			except RuntimeError:
				self.shapeApiType = om.MFn.kInvalid

		key = '%s%s%s' % (self.apiType, self.shapeApiType, self.name)
		return key

	def set_icon(self, stateShape=None):

		type = cmds.nodeType(self.fullname)
		if self.fullname:
			if type == "transform":

				shape = cmds.listRelatives(self.fullname, shapes=1, f=1)
				if shape:
					shapeType = cmds.nodeType(shape[0])
					type = shapeType
				else:
					type = type

			if type in typeList:
				self.setIcon(QtGui.QIcon(os.path.join(root_, "icons/{}.png".format(type))))
			else:
				self.setIcon(QtGui.QIcon(os.path.join(root_, "icons/menuIconConstraints.png")))

	@property
	def fullname(self):
		if not self.dagObj:
			return ''
		return self.dagObj

	@property
	def name(self):
		# print(self.fullname)
		return self.fullname.rsplit('|', 1)[-1]

	@property
	def parentname(self):
		return self.fullname.rsplit('|', 1)[0]


def get_json_data(str):
	listButtonsName_path_ = os.path.join(root_, str)
	json_data = None
	with open(listButtonsName_path_, "r") as inFile:
		json_data = json.load(inFile)

	return json_data


def set_json_data(json_data, str):
	listButtonsName_path_ = os.path.join(root_, str)
	with open(listButtonsName_path_, "w") as outfile:
		json.dump(json_data, outfile, indent=4)
