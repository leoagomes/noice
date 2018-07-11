extends KinematicBody2D

onready var tween = $Tween
onready var sprite = $Sprite

var angular_speed
var max_scale
var min_scale
var delta_scale

var team
var spawn_rate
var spawned_ships
var type

func _init():
	angular_speed = 0.1
	spawned_ships = 0
	spawn_rate = 10
	max_scale = Vector2(1.0, 1.0)
	min_scale = Vector2(0.75, 0.75)
	delta_scale = Vector2(0.1, 0.1)

	type = Utils.BASE

	set_process(true)

func animate():
	tween.interpolate_property(self, "rotation", rotation, rotation + angular_speed,
	0.5, tween.TRANS_LINEAR, Tween.EASE_OUT)
	if scale + delta_scale < max_scale && scale + delta_scale > min_scale:
		tween.interpolate_property(self, "scale", scale, scale + delta_scale,
		1.0, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	else:
		delta_scale = -delta_scale

	tween.start()

func _process(delta):
	animate()

func setup(p, t):
	position = p
	team = t