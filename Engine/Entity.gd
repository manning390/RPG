extends KinematicBody2D

const SPEED = 70
const DIRS = {
    "up": Vector2(0, -1),
    "down": Vector2(0, 1),
    "left": Vector2(-1, 0),
    "right": Vector2(1, 0)
}

export (bool) var canInput = true
export (bool) var canMove = true

var movedir = Vector2(0, 0)
var spritedir = "down"

func movement_loop():
    var motion = movedir.normalized() * SPEED
    move_and_slide(motion, Vector2(0, 0))

func spritedir_loop():
    for dir in DIRS:
        var vec = DIRS[dir]
        if movedir == vec:
            spritedir = dir

func anim_switch(animation):
    var newanim = str(animation, spritedir)
    if $anim.get_current_animation() != newanim:
        $anim.play(newanim)

func rand_dir():
    var i = randi() % DIRS.size()
    return DIRS[DIRS.keys()[i]]