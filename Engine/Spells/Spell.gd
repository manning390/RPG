extends Object

# Spell Elements
enum ELEMS {
	dark,
	fire,
	earth,
	elec,
	neutral,
	light,
	water,
	wind,
	nature
}

var name # String
var description # String
var element # Enum App.ELEMS
var index # Set by spell loader
var combo # Set by spell loader

func breath():
	pass

func mana():
	pass

func cast():
	pass

func unlock():
	pass
