extends Control

export (int, "Fire", "Water") var curpage = 0# setget draw_page # Makeshift button

var cols = 2
var rows = 5

onready var hx = get_node("Spellbook/SpellMenu") # Horizontal container
var vxs = [] # List of vertical containers
var btns = [] # List of buttons

onready var cursor = $Cursor

var spell_rect = Vector2(0, 24) # Hard Coded!

func _ready():
	print("_ready() Enter")
	# Cursor bounds
	cursor.ubounds = Vector2(cols, rows)
	# Generate the menu
	draw_page(curpage)

	print("_ready() Exit")

func draw_page(page):
	print("draw_page() Enter")
	# Save the cursor
	cursor.savepos(page)
	curpage = page

	# Clear out our vertical containers
	clear_vxs()

	# Create all of our columns
	for x in cols:
		var vx = VBoxContainer.new()
		vx.size_flags_horizontal = VBoxContainer.SIZE_EXPAND_FILL
		vx.size_flags_vertical   = VBoxContainer.SIZE_EXPAND_FILL
		vxs.append(vx)
		hx.add_child(vx)

		# Create all of our rows
		for y in rows:
			var spell = Game.spellbook[curpage][(x * rows) + y]
			var spellcontainer
			if spell.sid == null:
			 	spellcontainer = Panel.new()
			 	spellcontainer.rect_min_size = spell_rect
			else:
				print(spell, x, y)
				spellcontainer = ToolButton.new()
				spellcontainer.align = ToolButton.ALIGN_CENTER
				spellcontainer.text = spell.name

				btns.append(spellcontainer)

			spellcontainer.theme = load("res://Gui/menuTheme.tres")
			vx.add_child(spellcontainer)
	cursor.loadpos(page) # Move to page saved curpos
	print("draw_page() Exit")

func clear_vxs():
	print("clear_vxs() Enter")
	if vxs.empty():
		print("vxs empty ", "clear_vxs() Abort")
		return
	for vx in vxs:
		vx.free()
	vxs.clear()
	print("clear_vxs() Exit")