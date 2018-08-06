extends Node

var curpos = Vector2(0,0) # Internal virtual position of cursor
var ubounds = Vector2(0,0) # Upper bounds on cursor for the particular menu

var curmenu

# Cursor receives input and updates curpos
func _input(event):
	# Recieve input and update curpos
	var oldpos = curpos
	if event.is_action_pressed("ui_up"):
		curpos.y -= 1
	if event.is_action_pressed("ui_down"):
		curpos.y += 1
	if event.is_action_pressed("ui_left"):
		curpos.x -= 1
	if event.is_action_pressed("ui_right"):
		curpos.x += 1

	if event.is_action_pressed("ui_select"):
		pass

	if curpos != oldpos and _checkbounds():
		drawpos()

# Translate curpos to cursor.position
func drawpos():
	print("cursor.drawpos() enter", curpos)
	# $this.position = Vector2(0, curpos.y * 24) # Hard coded!

	print("cursor.drawpos() exit")

# Save curpos at loc
func savepos(loc):
	print("cursor.savepos() enter")
	Game.savedcurpos[loc] = curpos
	print("cursor.savepos() exit")

# Load curpos at loc
func loadpos(loc):
	print("cursor.loadpos() enter")
	curpos = Game.savedcurpos[loc]
	drawpos()
	print("cursor.loadpos() exit")

# Ensure within bounds
func _checkbounds():
	if ubounds == Vector2(0, 0):
		print("ERR: cursor.ubounds not set")
		get_tree().quit()
		return

	var oldpos = curpos

	if curpos.x < 0:
		curpos.x = 0
		_on_edge_left()
	elif curpos.x >= ubounds.x:
		curpos.x = ubounds.x - 1
		_on_edge_right()
	if curpos.y < 0:
		curpos.y = 0
		_on_edge_up()
	elif curpos.y >= ubounds.y:
		curpos.y = ubounds.y - 1
		_on_edge_down()

	return curpos == oldpos # if curpos adjusted, return false

func set_active_menu(menu):
	curmenu = menu
	# Load curpos, move curpos?


func _on_edge_up():
	print("cursor._edge_up() enter")
	# Check user options on how to handle the edge
	# Check the menu that we're in, and move cursor based on User options
	# Update cursor position ???
	print("cursor._edge_up() exit")

func _on_edge_down():
	print("cursor._edge_down() enter")
	# Do stuff
	print("cursor._edge_down() exit")

func _on_edge_left():
	print("cursor._edge_left() enter")
	# Do stuff
	print("cursor._edge_left() exit")

func _on_edge_right():
	print("cursor._edge_right() enter")
	# Do stuff
	print("cursor._edge_right() exit")