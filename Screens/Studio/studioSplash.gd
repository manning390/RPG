extends Control

export (PackedScene) var nextScene
export (String) var seedString = "00000000000000000000000000000000"
export (bool) var setTimeSeed = true
export (int) var seedLength = 32

var isLoading = true
var prevInputType

func _ready():
    print("studioSplash._ready() enter")
    # Get time for initial seed
    if setTimeSeed:
        seedString = str(OS.get_unix_time()).pad_zeros(seedLength)

    # Run animation
    fade_in_out()
    print("studioSplash._ready() exit")

func _input(event):
    print("studioSplash._input() enter")
    # If any button/mouse/joy input is recieved put it at the end of the seed
    if event is InputEventMouseButton:
        seedString = str(seedString, int(event.position.length()))
    elif event is InputEventMouseMotion:
        seedString = str(seedString, int(event.position.length()))
    elif event is InputEventKey:
        seedString = str(seedString, event.scancode)
    elif event is InputEventJoypadMotion:
        seedString = str(seedString, int(event.axis_value))
    elif event is InputEventJoypadButton:
        seedString = str(seedString, event.button_index)

    # To avoid memory overflow, lets limit the length after each input
    if seedString.length() > seedLength:
        seedString.erase(0, seedString.length() - seedLength)
    print(seedString)

func fade_in_out():
    print("fade in out")
    var anim = $AnimationPlayer
    anim.play("fade_in_out")

# Connected on animation finished
func goto_next_scene(anim_name):
    print("go to next scene")
    # If we are still loading when the splash screen anim is done
    # we we try to load next scene every second
    if(isLoading):
        var timer = Timer.new()
        add_child(timer)
        timer.set_wait_time(1) # seconds
        timer.set_one_shot(false)
        timer.connect("timeout", self, "next_scene")
        timer.start()
    else:
        next_scene()

func next_scene():
    print("is loading")
    if(!isLoading):
        print("We are now loading the next scene from the splash screen!")

        # Make the seed seedLength characters long
        if seedString.length() > seedLength:
            seedString.erase(0, seedString.length() - seedLength) # take the last seedLength chars
        else:
            seedString.pad_zeros(seedLength)
        Game.SEED = seedString.hash()
        seed(Game.SEED)
        print(Game.SEED)

        # Load next scene
        get_parent().add_child(nextScene.instance())
        queue_free()