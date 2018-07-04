extends KinematicBody2D

# Nodes
onready var sprite = $Sprite
onready var tween = $Tween
onready var detectioin_range = $DetectionRange

# Vectors
var target_pos # Position of the target or mouse
var velocity # Vector
var heading # Vector indicating the direction of the ship's nose
var mouse_pos

# Number variables
var linear_speed # Speed to move forward
var angular_speed # Rotation speed
var cooldown # Cooldown when pursuing a enemy base/ship
var distance_to_keep # Distance to keep from the position where the mouse clicked
var attack # Quantity of damage it causes when fighting
var life  # Self explanatory
var team # See Utils.Team enum
var type # See Utils.Type enum
var color # Team color

# Booleans
var can_pursuit # Whether or not can pursue a enemy base/ship
var pursuing_base # If the ship is pursuing a enemy/neutral base
var pursuing_ship # If the ship is pursuing a enemy/neutral ship

# Objects
var pursued_object # Self explanatory

# Constants
const COOLDOWN_TIME = 15 # Cooldown when seeking a enemy base/ship

func _init():
	target_pos = Vector2(0, 0)
	velocity = Vector2(0, 0)
	heading = Vector2(1, 0)
	mouse_pos = get_global_mouse_position()

	linear_speed = 100
	angular_speed = 0.1
	cooldown = 0
	distance_to_keep = 39
	attack = 2
	life = 100
	type = Utils.SHIP

	can_pursuit = true
	pursuing_base = false
	pursuing_ship = false

	set_process(true)

# Called when a ship is created by WorldController
func setup(pos, t, target):
	# TODO: pass the texture
	position = pos
	team = t
	target_pos = target

func is_pursuing():
	return pursuing_base || pursuing_ship

func _unhandled_input(event):
	# Pressing the mouse's left button makes the ship 
	# 'chase' the location it's been pressed
	if Input.is_action_just_pressed("ui_mouse_left"):
		mouse_pos = get_global_mouse_position()
		target_pos = mouse_pos
		# Need to cease pursuing some object to pursue the mouse
		can_pursuit = false
		cooldown = COOLDOWN_TIME

# Handles the Tween code to rotate the ship
func rotate_smoothly():
	tween.interpolate_property(self, "rotation_degrees", rad2deg(get_rotation()),
	rad2deg(heading.angle()), 1, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	tween.start()

# Manages the cooldown
func cooldown():
	if cooldown == 0:
		can_pursuit = true
		cooldown = COOLDOWN_TIME
	elif cooldown > 0:
		cooldown -= 1

# Used for greater processing speed
func _process(delta):
	calculate_velocity()
	cooldown()
	# Rotating the ship to look at the mouse position
	rotate_smoothly()

# TODO: fire an event when a object is in range then call this function
# TODO: when the body enters, put in an array, when the body exits, remove from array
func calculate_velocity():
	if !is_pursuing():
		# Keep a certain distance from the target_pos
		# It's not used to keep distance from enemy bases/enemies,
		# it's used to keep distance from the mouse_pos
		if Utils.is_in_range(position, target_pos, distance_to_keep):
			velocity = Vector2(0, 0)
		# Is it's not in range, keep seeking the mouse
		else:
			target_pos = mouse_pos
			heading = target_pos - position
			velocity = heading.normalized() * linear_speed

	else:
		# Rotated towards the pursued enemy
		if can_pursuit && pursued_object:
			target_pos = pursued_object.position
			heading = target_pos - position
			# (x, y)*(y, -x) = 0
			velocity = Vector2(heading.y, -heading.x).normalized() * linear_speed
		# Chases the last mouse position
		else:
			target_pos = mouse_pos
			heading = target_pos - position
			velocity = heading.normalized() * linear_speed

func _physics_process(delta):
	# Moving the ship
	move_and_collide(velocity*delta)

func _on_DetectionRange_area_shape_entered(area_id, area, area_shape, self_shape):
	var body = area.get_parent()

	if body.team != team:
		if body.type == Utils.BASE:
			if can_pursuit && !pursuing_ship:
				pursuing_base = true

		elif body.type == Utils.SHIP:
			if can_pursuit:
				pursuing_ship = true
				pursuing_base = false

		pursued_object = body


func _on_DetectionRange_area_shape_exited(area_id, area, area_shape, self_shape):
	var body = area.get_parent()
	if body == pursued_object:
		if body.type == Utils.SHIP:
			pursuing_ship = false
		elif body.type == Utils.BASE:
			pursuing_base = false
		pursued_object = null
