extends "res://Gui/SelectableMenu.gd"

func _ready():
    var player = $Player
    player.canInput = false
    player.canMove = false

# Selected change callback
func _selected_update():
    print(selected.text)
    # Move cursor position

# Cancel callback
func _cancel():
    # Save cursor position if set (?)

    # Enable player control
    player.canInput = true
    player.canMove = true

    # Delete main menu instance
    queue_free()