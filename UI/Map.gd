extends Control

func _init():
	add_user_signal("exit")

func _ready():
	hide()
	connect("exit", self, "hide")

func _input(event):
	if(event.is_action_pressed("ui_cancel")):
		emit_signal("exit")
