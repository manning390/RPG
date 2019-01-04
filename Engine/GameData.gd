extends Node

# Seed hash generated from startup input
var SEED
var loaded = false

var breath_max = 100
var mana_max = 100
var hp_max = 50

var spellbook = []
var spellbook_start_page = 0

# Cursor variables
var savedcurpos = []
var skipemptymenu = true