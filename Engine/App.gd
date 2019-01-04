tool
extends Node

var player

var spells = []

func _ready():
    _load_spells()
    var spreads = 5
    var pages = spreads * 2
    var spellbook = []
    for x in pages: # Each spread
        spellbook.append([])

        Game.savedcurpos.append(Vector2(0,0)) # curpos for everypage

        for y in 20: # Each page postion
            spellbook[x].append({"sid":null, "name":null})


    # Hard coded!
    spellbook[0][0]  = {"sid":0, "name":"Fire"}
    spellbook[0][3]  = {"sid":1, "name":"Fire II"}
    spellbook[0][6]  = {"sid":2, "name":"Fira"}
    spellbook[1][2]  = {"sid":3, "name":"Shade"}
    spellbook[1][8]  = {"sid":4, "name":"Shadow"}

    Game.spellbook = spellbook

    Game.loaded = true

# Reads a csv into a dict
#
# param csv_file           path to csv file
# param dict_to_append     reference to dictionary
# param DICT_HEADERS_LIST  optional headers list
func csv_import(csv_file, dict_to_append, DICT_HEADERS_LIST):
    var file = File.new()
    file.open(csv_file,file.READ)
    var is_header = true
    var  attributes_list =  []
    file.seek(0)
    var temp_dict = {}
    while !file.eof_reached():
        var line = file.get_csv_line()
        if is_header == true:
            for item in attributes_list:
                DICT_HEADERS_LIST.append(item)
            is_header = false
        else:
            for i in range(0,attributes_list.size()):
                temp_dict[attributes_list[i]] = line[i]
            dict_to_append[line[0]] = temp_dict
            temp_dict = {}

# Returns list of file names from dir
#
# param path               path to dir
func get_files(path):
    var files = []
    var dir = Directory.new()
    dir.open(path)
    dir.list_dir_begin()

    while true:
        var file = dir.get_next()
        if file == "":
            break
        elif not file.begins_with("."):
            files.append(file)

    dir.list_dir_end()
    return files

func _load_spells():
    # Get all of the spell instance files
    var dir = "res://Engine/Spells/Data/"
    var files = self.get_files(dir)

    # Save into dict
    # Count total number
    var i = 0
    for file in files:
        spells.append(load(str(dir, file)).new()) # load the file, instance it, put in the list
        i += 1
    # Create key length based on number
    # Assign keys
    # Generate key combo mapping

    get_tree().quit() # For testing

# Runs on startup(?)
func _load_save():
    print("App._load_save() enter")
    print("lol idk")
    # https://gist.github.com/brunosxs/27d5aefadcb9c9ce2ec5a12a31995168
    print("App._load_save() exit")

# Recieves Signal "save" from GUI/MainMenu, connected in GUI
func _on_save():
    print("App._on_save() enter")
    var F = File.new()
    F.open(str("user://save/", Game.SEED, "_", OS.get_unix_time(),".save"), File.READ_WRITE)
    F.store_var(Game)
    F.close()
    print("App._on_save() exit")