extends Control

export(StyleBox) var style_selected
export(StyleBox) var style_empty

onready var entries = [
    get_node("VBoxContainer/Spells"),
    get_node("VBoxContainer/Map"),
    get_node("VBoxContainer/Options"),
    get_node("VBoxContainer/Save"),
    get_node("VBoxContainer/Exit")
]

onready var cursor = get_node("../Cursor")

var signals = ["spells", "map", "options", "save", "exit"]

var index = 0

func _init():
    for sig in signals:
        add_user_signal(sig)

func _ready():
    hide()
    connect("exit", self, "hide")
    update_hover()

# Tail recursion to decrement to visible index
func _set_to_previous_visible_index(i):
    if(i == index):
        return
    if(i < 0):
        i = entries.size()-1
    (index=i) if entries[i].is_visible() else _set_to_previous_visible_index(i-1)

# Tail recursion to increment to visible index
func _set_to_next_visible_index(i):
    # print(i, " ", index)
    if(i == index):
        return
    if(i > entries.size()-1):
        i = 0
    (index=i) if entries[i].is_visible() else _set_to_next_visible_index(i+1)

func _input(event):
    if (event.is_action_pressed("ui_up")):
        _set_to_previous_visible_index(index-1)
        update_hover()

    if (event.is_action_pressed("ui_down")):
        _set_to_next_visible_index(index+1)
        update_hover()

    if(event.is_action_pressed("ui_left")):
        _set_to_next_visible_index(0)
        update_hover()

    if(event.is_action_pressed("ui_right")):
        _set_to_previous_visible_index(entries.size()-1)
        update_hover()

    if(event.is_action_pressed("ui_accept")):
        emit_signal(signals[index])

    if(event.is_action_pressed("ui_cancel")):
        emit_signal("exit")

func update_hover():
    cursor.position = entries[index].get_position()
