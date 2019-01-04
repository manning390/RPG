extends Node

var _breath
var _mana
var _hp
var _spellbook

onready var breath = get_node("UI/Breath")
onready var mana = get_node("UI/Mana")

func _ready():
	_enter_combat()
	connect("exit", self, "_exit_combat")

func _enter_combat():
	# Load player
	## Load current stats, equipment, spells
	# Stats
	_breath = Game.breath_max
	_mana = Game.mana_max
	_hp = Game.hp_max

	# Spells
	_spellbook = Game.spellbook

	# Load enemies
	## Load stats, positions

	_combat_loop()

# Only handle on enter
func _input(event):
    if (event.is_action_pressed("ui_accept")):
    	print("accept")

    if (event.is_action_pressed("ui_cancel")):
    	print("cancel")

func _exit_combat():
	print("combat exited")
	pass

func _combat_loop():
	print("Combat loop entered")
	pass