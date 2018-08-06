extends Control

onready var cursor = $Cursor

var spread = 0
onready var lpage = get_node("HBox/LeftPage")
onready var rpage = get_node("HBox/RightPage")

var cols = 2
var rows = 5

var _lvxs = [] # Left  Vertical boXeS
var _rvxs = [] # Right Vertical boXeS

var _elxs = [] # ELement boXeS

func _ready():
	# print("Spread._ready() enter")
	print(cursor)
	cursor.ubounds = Vector2(cols * 2, rows)
	render()
	# print("Spread._ready() exit")

func render():
	# print("Spread.render() enter")

	_clear()

	var vxt = VBoxContainer.new() # Vertical boX Template
	vxt.size_flags_horizontal = VBoxContainer.SIZE_EXPAND_FILL
	vxt.size_flags_vertical   = VBoxContainer.SIZE_EXPAND_FILL
	var elxt = Label.new() # ELement boX Template
	elxt.rect_min_size = Vector2(0, 24) # Hard coded!
	elxt.align = Label.ALIGN_CENTER
	elxt.theme = load("res://Gui/menuTheme.tres")

	# Left
	for x in cols:
		var vx = vxt.duplicate() # local scoped Vertical boX
		_lvxs.append(vx)
		lpage.add_child(vx)
		for y in rows:
			var spell = ""
			if Game.spellbook[spread + 0][(x * rows) + y].sid != null:
				spell = Game.spellbook[spread + 0][(x * rows) + y].name # Left page (spread + 0)
			var elx = elxt.duplicate() # local scoped ELement boX
			elx.text = spell
			print(spell, x , y)

			_elxs.append(elx)
			vx.add_child(elx)
	# Right
	for x in cols:
		var vx = vxt.duplicate() # local scoped Vertical boX
		_rvxs.append(vx)
		rpage.add_child(vx)
		for y in rows:
			var spell = ""
			if Game.spellbook[spread + 1][(x * rows) + y].sid != null:
				spell = Game.spellbook[spread + 1][(x * rows) + y].name # Right page (spread + 1)
			var elx = elxt.duplicate() # local scoped ELement boX
			elx.text = spell
			print(spell, x , y)

			_elxs.append(elx)
			vx.add_child(elx)

	# print("Spread.render() exit")

func _clear():
	print("Spread._clear() enter")
	if !_lvxs.empty():
		for vx in _lvxs:
			vx.free()
	if !_rvxs.empty():
		for vx in _rvxs:
			vx.free()
	_lvxs.clear()
	_rvxs.clear()
	_elxs.clear()
	print("Spread._clear() exit")
