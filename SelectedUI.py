import maya.cmds as cmds
from PySide2 import QtWidgets, QtGui, QtCore
from maya.app.general.mayaMixin import MayaQWidgetDockableMixin , MayaQWidgetBaseMixin
import os
import sys

import maya.OpenMaya as om
import maya.OpenMayaUI as mui

root_ = os.path.dirname(__file__)
typeList  = ["mesh", "nurbsSurface", "nurbsCurve", "joint", "locator", "shape", "follicle",
			 "transform", "camera", "baseLattice", "lattice", "clusterHandle", "indefined", "TypeAll",
			 "areaLight", "ambientLight", "directionalLight", "volumeLight", "pointLight", "spotLight"]


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
	def __init__(self, TypeIcon, TypeList = []):
		super(ButtonType, self).__init__()

		self.TypeIcon = TypeIcon
		self.TypeList = TypeList

		self.setObjectName(TypeIcon + "id")
		self.setFixedSize(16, 16)
		self.set_icon()

	def set_icon(self):

		if self.TypeIcon in typeList:
			self.setIcon(QtGui.QIcon(os.path.join(root_, "icons/{}.png".format(self.TypeIcon))))
		else:
			self.setIcon(QtGui.QIcon(os.path.join(root_, "icons/menuIconConstraints.png")))

	def mouseReleaseEvent(self, event):
		super(ButtonType, self).mouseReleaseEvent(event)
		self.isTypeList.emit(self.TypeList)

	def enterEvent(self, event):
		self.setCursor(QtCore.Qt.PointingHandCursor)
		super(ButtonType, self).enterEvent(event)

	def leaveEvent(self, event):
		self.setCursor(QtCore.Qt.ArrowCursor)
		super(ButtonType, self).leaveEvent(event)




class MSL_Selected(MayaQWidgetBaseMixin, QtWidgets.QDialog):

	def __init__(self, *args, **kwargs):
		super(MSL_Selected, self).__init__(*args, **kwargs)

		self.resize(200,500)
		self.setObjectName("CustomMSL_Selected")
		self.setWindowTitle("Selected")

		self.main_layout = QtWidgets.QVBoxLayout(self)
		self.main_layout.setMargin(2)
		self.main_layout.setSpacing(2)

		# self.menuUI()
		self.setupUI()

		# QtCore.QTimer.singleShot(1, self.set_list)

		# self.Test()

	def setupUI(self):

		self.List_BTN = ListBTN("List")
		self.list_widgets = QtWidgets.QWidget()
		self.list_widgets.setFixedWidth(16)

		self.model = QtGui.QStandardItemModel()
		self.model.setItemPrototype(DagTreeItem())

		self.view = QtWidgets.QListView()
		self.view.setModel(self.model)
		# self.view.header().setVisible(False)
		self.view.setEditTriggers(self.view.NoEditTriggers)
		self.view.setSelectionMode(self.view.ExtendedSelection)

		self.list_layot_main = QtWidgets.QHBoxLayout()
		self.List_view_layout = QtWidgets.QVBoxLayout()
		self.widget_layout = QtWidgets.QVBoxLayout(self.list_widgets)
		self.widget_layout.setMargin(0)
		self.widget_layout.setSpacing(2)
		self.widget_layout.setAlignment(QtCore.Qt.AlignTop)



		self.List_view_layout.addWidget(self.List_BTN)
		self.List_view_layout.addWidget(self.view)

		self.list_layot_main.addLayout(self.List_view_layout)
		self.list_layot_main.addWidget(self.list_widgets)


		self.main_layout.addLayout(self.list_layot_main)

		self.List_BTN.clicked.connect(self.set_list)
		self.view.selectionModel().selectionChanged.connect(self.selectionChanged)

	def gettypeLists(self, Sellist = []):

		librLisr = {}
		shapelist =[]

		librLisr["TypeAll"] = Sellist

		if Sellist:
			for i in Sellist:
				type  = cmds.nodeType(i)

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

								elif shapeType in ["areaLight", "ambientLight", "directionalLight", "volumeLight", "pointLight", "spotLight"]:

									shapeType = "ambientLight"

								if shapeType in librLisr.keys():
									librLisr[shapeType].append(i)

									librLisr["shape"].append(shape)
								else:
									librLisr[shapeType] = [i]
									librLisr["shape"] = [shape]

					else:
						if type in librLisr.keys() :
							librLisr[type].append(i)
						else:
							librLisr[type] =  [i]

				else:
					if type == "joint":
						if type in librLisr.keys() :
							librLisr[type].append(i)
						else:
							librLisr[type] =  [i]

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

	def Creat_ButtonType(self, library = {}):

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
			ListLongName    = cmds.ls(sl=1, l=1)

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



	def menuUI(self):
		self.menu = QtWidgets.QMenuBar()
		displayMenu = self.menu.addMenu('Display')

		sortMenu = displayMenu.addMenu('Sort Order')

		# Create an exclusive set of sorting mode options
		self.sortActions = QtWidgets.QActionGroup(sortMenu)

		self.sortAction1 = self.sortActions.addAction('Scene Hierarchy')
		self.sortAction1.setCheckable(True)
		self.sortAction1.setChecked(True)
		sortMenu.addAction(self.sortAction1)

		self.sortAction2 = self.sortActions.addAction('Alphabetical Within Type')
		self.sortAction2.setCheckable(True)
		sortMenu.addAction(self.sortAction2)

		# connect sortmethod changes to a slot
		self.main_layout.addWidget(self.menu)
		self.sortActions.triggered.connect(self.sortMethodChanged)

	def Test(self):
		self.model = QtGui.QStandardItemModel()
		self.model.setItemPrototype(DagTreeItem())

		# Use our custom sort proxy model to sit between our
		# original model, and the tree view
		self.sortModel = DagTreeProxyModel()
		self.sortModel.setSourceModel(self.model)
		self.sortModel.setDynamicSortFilter(True)
		# each DagTreeItem will have its special sort key set as
		# the UserRole data. Use this data for sort comparisons
		self.sortModel.setSortRole(QtCore.Qt.UserRole)

		view = QtWidgets.QTreeView()
		# set the sort model to the view instead of the original
		view.setModel(self.sortModel)
		view.header().setVisible(False)
		view.setEditTriggers(view.NoEditTriggers)
		view.setSelectionMode(view.ExtendedSelection)

		self.view = view
		self.main_layout.addWidget(self.view)

		QtCore.QTimer.singleShot(1, self.initDisplay)

		#
		# Connections
		#
		# self.view.expanded.connect(self.nodeExpanded)
		self.view.selectionModel().selectionChanged.connect(self.selectionChanged)


	def initDisplay(self):
		"""
		Initialize the model with the root world items
		"""
		self.model.clear()


		excludes = set([
			'|groundPlane_transform',
			'|Manipulator1',
			'|UniversalManip',
			'|CubeCompass',
		])

		roots = self.scanDag(mindepth=1, maxdepth=-1, exclude=excludes)
		if roots:

			self.model.appendColumn(roots)

		# apply the current sort method to the model
		self.sortMethodChanged()

	def nodeExpanded(self, idx):
		"""
		nodeExpanded(QModelIndex idx)
		Slot to handle an item in the list being expanded.
		Populates the children of this items immediate children.
		"""

		# because we are now using a sort proxy model on the view,
		# this method will receive a proxy index instead of the source
		# index. We need to map it to the original index first so we
		# can then look up the item in the source model.
		idx = self.sortModel.mapToSource(idx)

		item = self.model.itemFromIndex(idx)

		if item.hasChildren():
			for row in range(item.rowCount()):

				child = item.child(row)
				child.removeRows(0, child.rowCount())
				grandChildren = self.scanDag(child)
				if grandChildren:
					child.appendRows(grandChildren)

				# print("child {}, grandChildren {}".format(child, grandChildren))
	#
	def selectionChanged(self):
		"""
		selectionChanged()
		Slot called when the selection of the view has changed.
		Selects the corresponding nodes in the Maya scene that
		match the selected view items.
		"""
		sel = self.view.selectedIndexes()
		nodes = [self.model.itemFromIndex(i).fullname for i in sel]
		if nodes:
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

	@staticmethod
	def scanDag(root=None, mindepth=1, maxdepth=1, exclude=None):
		"""
		scanDag(root=None, mindepth=1, maxdepth=1, exclude=None) -> list
		root 		- either an MDagPath or DagTreeItem to start from
		mindepth 	- starting depth of items to return (default 1; immediate children)
		maxdepth 	- ending depth of items to return (default 1; immediate children)
		exclude 	- a sequence of strings representing node paths that should be skipped
		Walks the DAG tree from a starting root, through a given depth
		range. Returns a list of the top level children of the root as
		DagTreeItem's. Decendants of these items already have been added
		as DagTreeItem children.
		mindepth or maxdepth may be set to -1, in which case those limits will
		be ignored altogether.
		"""
		# Allow either a DagTreeItem or an MDagPath
		if isinstance(root, DagTreeItem):
			root = root.dagObj

		dagIt = om.MItDag()
		root = root or dagIt.root()
		exclude = exclude or set()

		dagIt.reset(root, om.MItDag.kDepthFirst)


		# These will be our final top-most nodes from the search
		nodes = []

		# This will map node string paths to the items to help us
		# easily look up a parent at any point in the search.
		itemMap = {}

		while not dagIt.isDone():

			depth = dagIt.depth()


			# if the iterator has gone past our target
			# depth, prune out the tree from here on down,
			# so it is not used in future loops
			if (maxdepth > -1) and (depth > maxdepth):
				dagIt.prune()

			# this would allow us to skip past an amount of
			# levels from the root, if mindepth > 1
			elif depth >= mindepth:
				dagPath = om.MDagPath()
				dagIt.getPath(dagPath)

				path = dagPath.fullPathName()

				if path and path not in exclude:
					item = DagTreeItem(dagPath)


					# save this item in our mapping
					itemMap[item.fullname] = item
					# print(itemMap)
					# If this item has a parent, add it to that
					# parent DagTreeItem.
					# Otherwise, just add it to our top level list
					parent = itemMap.get(item.parentname)

					if parent:
						parent.appendRow(item)

					else:
						nodes.append(item)
						# print(nodes,"Root")
				# prune out items that were in our excludes list
				else:
					dagIt.prune()

			dagIt.next()
		# print(nodes)
		return nodes

	@classmethod
	def showOutliner(cls):
		"""
		showOutliner() -> (str dockLayout, Outliner widget)
		Creates a Outliner widget inside of a Maya dockControl.
		Returns the dockControl path, and the Outliner widget.
		"""
		win = cls(parent=getMainWindow())
		size = win.size()

		name = mui.MQtUtil.fullName(long(sip.unwrapinstance(win)))

		dock = cmds.dockControl(
			allowedArea='all',
			area='left',
			floating=True,
			content=name,
			width=size.width(),
			height=size.height(),
			label='Custom Outliner')

		return dock, win
	#
class DagTreeProxyModel(QtCore.QSortFilterProxyModel):

	DAG_TYPES = {
		'NURBS Objects'  	: [om.MFn.kNurbsSurface, om.MFn.kNurbsCurve],
		'Polygon Objects'	: [om.MFn.kPolyCreator],
		'Cameras'			: [om.MFn.kCamera],
		'Lights'			: [om.MFn.kLight],
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

		# self.setIcon((QtGui.QIcon(os.path.join(root_, "icons/tool.svg")),"Edit"))

		# Add the sort key string as a UserRole data to
		# the item. We can then set the model to use this
		# role when performing sort comparisons.
		# self.setData(self.sortKey, QtCore.Qt.UserRole)
		if self.fullname:
			self.set_icon()



	def __repr__(self):
		return "<%s: %s>" % (self.__class__.__name__, self.name)

	@property
	def sortKey(self):
		"""
		Computed property that builds a sort key based on a
		combination of attributes.
		Allows sorting to consider multiple keys.
		"""
		if self.dagObj:
			self.apiType = self.dagObj.apiType()

			dagCopy = om.MDagPath(self.dagObj)

			try:
				dagCopy.extendToShape()
				self.shapeApiType = dagCopy.apiType()
			except RuntimeError:
				self.shapeApiType = om.MFn.kInvalid

		key = '%s%s%s' % (self.apiType, self.shapeApiType, self.name)
		return key


	def set_icon(self, stateShape = None):
		# typeList  = ["mesh", "locator", "joint", "nurbsSurface", "nurbsCurve",
		# 			 "transform", "camera", "baseLattice", "lattice", "clusterHandle"]
		type = cmds.nodeType(self.fullname)
		if self.fullname:
			if type == "transform":

				shape = cmds.listRelatives(self.fullname, shapes = 1, f= 1)
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
