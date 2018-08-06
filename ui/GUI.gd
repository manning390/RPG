extends CanvasLayer

onready var menu = get_node("main_menu")
onready var options = get_node("options")

func _ready():
	print("GUI._ready() enter")
	menu.connect("option", self, "_on_menu_options")
	print("GUI._ready() exit")

func _on_menu_options():
	print("GUI._on_menu_options() enter")
	menu.hide()
	menu.set_process_input(false)
	show_options()
	yield(options, "exit")
	menu.show()
	menu.set_process_input(true)
	print("GUI._on_menu_options() exit")
