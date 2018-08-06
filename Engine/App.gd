tool
extends Node

var player

# Spell Elements
# var elems = {
#     dark,
#     earth,
#     elec,
#     fire,
#     light,
#     neutral,
#     water,
#     wind,
#     wood
# }
var spelldict = []

func _ready():
    var spreads = 5
    var pages = spreads * 2
    var spellbook = []
    for x in pages: # Each spread
        spellbook.append([])

        Game.savedcurpos.append(Vector2(0,0)) # curpos for everypage

        for y in 20: # Each page postion
            spellbook[x].append({"sid":null, "name":null})

    Game.spellbook = spellbook

    # Hard coded!
    spellbook[0][0]  = {"sid":0, "name":"Fire"}
    spellbook[0][3]  = {"sid":1, "name":"Fire II"}
    spellbook[0][6] = {"sid":2, "name":"Fira"}
    spellbook[1][2] = {"sid":3, "name":"Shade"}
    spellbook[1][8] = {"sid":4, "name":"Shadow"}

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

func load_spells():
    # Get all of the spell instance files
    var files = self.get_files("res://Engine/Spells/Data/")
    # Save into dict
    # Count total number
    # Create key length based on number
    # Assign keys
    # Generate key combo mapping