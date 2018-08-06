extends Control

var index # Unique id

export (int) var cols = 0 # Number of cols in menu
export (int) var rows = 0 # Number of rows in menu

onready var _hx = HBoxContainer.new() # Row container
var _vxs = [] # Column containers

onready var cursor = $Cursor # Cursor
var prev # Previous menu for stack

var elems = [] # Menu elements
var _elemxs = [] # Menu instanced elements

# Clear out children of hx
func _clear():
	if _vxs.empty():
		return
	for vx in _vxs:
		vx.free()
	_vxs.clear()
	_elemxs.clear()

# On enter menu
func enter(prev = null):
	cursor.loadpos(self.index)

# On exit menu
func exit(next = null):
	cursor.savepos(self.index)

# Render menu
func render():
	if elems.empty():
		return

	_clear()

	for x in cols:
		var vx = VBoxContainer.new()
		vx.size_flags_horizontal = VBoxContainer.SIZE_EXPAND_FILL
		vx.size_flags_vertical   = VBoxContainer.SIZE_EXPAND_FILL
		_vxs.append(vx)
		_hx.add_child(vx)

		for y in rows:
			var elem = on_elem_instance(elems[(x * rows) + y], x, y)

			_elemxs.append(elem) # ???
			vx.add_child(elem)

# Abstract function, called on how to render element
func on_elem_instance(elem, x, y):
	pass
