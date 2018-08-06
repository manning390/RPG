extends "res://Engine/Entity.gd"

func _physics_process(delta):
    if canInput:
        controls_loop() # Calculates movement
        interact_loop(spritedir) # Checks interaction in dir
    if canMove:
        spritedir_loop() # Sets sprite direction
        movement_loop() # Moves character
        anim_loop() # Changes characters animation

func anim_loop():
    # If we're up against something and trying to move into it, push against it
    if is_on_wall():
        for dir in DIRS:
            var vec = DIRS[dir]
            if spritedir == dir and test_move(transform, vec):
                anim_switch("push")
    elif movedir.length() > 0: # else if we're moving, move
        anim_switch("walk")
    else: # else, stand still
        anim_switch("idle")


func controls_loop():
    var UP = Input.is_action_pressed("ui_up")
    var DOWN = Input.is_action_pressed("ui_down")
    var LEFT = Input.is_action_pressed("ui_left")
    var RIGHT = Input.is_action_pressed("ui_right")

    movedir.x = -int(LEFT) + int(RIGHT)
    movedir.y = -int(UP) + int(DOWN)

func interact_loop(interdir):
    var INTER = Input.is_action_pressed("ui_interact")
    if false:
        # set anim to idle incase we're moving
        canMove = false
        anim_switch("idle") # In case we we're moving
        # Call back on interaction thing