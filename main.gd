extends Control

export (PackedScene) var nextScene
var nextSceneInstance

# Loading thread
onready var loadingThread = Thread.new()

func _ready():
    # Begin loading Data
    loadingThread.start(self, "load_data")

    # Display splash screen
    splash_screen()

func splash_screen():
    print("Load Splash Screen")

    # Create an instance
    nextSceneInstance = nextScene.instance()

    # Add to nextScene
    add_child(nextSceneInstance)

func load_data(data):
    # Simulate data loading
    for i in range(0, 9000000):
        for j in range(0, 7):
            pass
    print("Done Loading Data!")
    nextSceneInstance.isLoading = false
