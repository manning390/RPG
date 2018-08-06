extends Node2D

func _ready():
    $Seed.text = str(GVars.SEEDHASH)
