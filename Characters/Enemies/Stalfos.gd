extends "res://Engine/Entity.gd"

const SPEED = 40

var movetimer_length = 15
var movetimer = 0
var type = "enemy"

func _ready():
    $anim.play("default")
    movedir = rand_dir()

func _physics_process(delta):
    movement_loop()
    if movetimer > 0:
        movetimer -= 1
    elif movetimer == 0 || is_on_wall():
        movedir = rand_dir()
        movetimer = movetimer_length
