extends Control

var index = 0

func _init():
	add_user_signal("exit")
	_load_spells()

func _ready():
	hide()
	connect("exit", self, "hide")

func _input(event):
	if(event.is_action_pressed("ui_cancel")):
		emit_signal("exit")

func update_hover():
    print("index ", index)

func _load_spells():
	print("Spells._load_spells() enter")
	# do stuff
	print("spells._load_spells() exit")
