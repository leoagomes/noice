extends Node

onready var factory = preload("res://assets/scenes/Objects.tscn").instance()
onready var background = $Background

var bases = Array()
var ships = Array()
onready var player = $Player

func _ready():
	background.region_rect = Rect2(Utils.ORIGIN, Utils.map_limit)
	create_base(Vector2(400, 400), Utils.B)
	create_base(Vector2(1000, 1000), Utils.B)
	create_base(Vector2(1300, 100), Utils.B)
	for i in range(100, 140, 40):
		for j in range(100, 140, 40):
			create_ship(Vector2(i, j), Utils.A, Vector2(i, j))

func create_base(pos, team):
	# Creates a new base
	bases.append(factory.generate_base())
	# Add this new base as a child
	player.add_child(bases.back())
	# Changes the position of the base
	bases.back().setup(pos, team)

func create_ship(pos, team, target=Vector2(0, 0)):
	# Creates a new ship
	ships.append(factory.generate_ship())
	# Add the ship as a child
	player.add_child(ships.back())
	# Changes the position
	ships.back().setup(pos, team, target)

# Creates the bases in the game
# TODO
func generate_map():
	pass

# Generates a random background for every game
# TODO
func generate_background():
	pass