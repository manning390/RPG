extends CanvasLayer

onready var menu = get_node("MainMenu")
onready var spells = get_node("Spells")
onready var map = get_node("Map")
onready var cursor = get_node("Cursor")
# onready var options = get_node("Options")

func _ready():
	menu.connect("spells", self, "_on_menu_action", [spells])
	menu.connect("map", self, "_on_menu_action", [map])
	# menu.connect("options", self, "_on_menu_action", "options")
	menu.connect("save", App, "_on_save")

	show_menu() # Testing only

# Call to open menu
func show_menu():
	_open(menu)
	cursor.show()
	yield(menu, "exit")
	cursor.hide()
	_close(menu)

func is_visible():
	return menu.is_visible()# || options.is_visible()

func _on_menu_action(node):
	_close(menu)
	_open(node)
	yield(node, "exit")
	_close(node)
	_open(menu)

func _open(node):
	node.show()
	node.set_process_input(true)

func _close(node):
	node.hide()
	node.set_process_input(false)
