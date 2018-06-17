extends KinematicBody2D

var mouse_pos = Vector2(0, 0)
var velocity = Vector2(0, 0)
var heading = Vector2(0, 0)
var linear_speed = 50

# We also use the variable 'rotation' from the class
# TODO var team
# TODO var attack
# TODO var life

# Constants
const ORIGIN = Vector2(0, 0)

func _init():
	setup(200, 200)
	pass

# Initializes the ship position.
# 'position' = Vector2
func setup(x, y):
	position.x = x
	position.y = y
	pass

func _unhandled_input(event):
	var rot
	var prev_pos = position
	# Pressing the mouse's left button makes the ship 
	# go to its location
	if Input.is_action_pressed("ui_mouse_left"):
		mouse_pos = get_global_mouse_position()
		heading.x = mouse_pos.x - position.x
		heading.y = mouse_pos.y - position.y
		heading = heading.normalized()
		velocity = linear_speed * heading

		#print("Position: " + String(position))
		#print("Mouse: " + String(mouse_pos))
		#print("Heading: " + String(heading))

		rot = heading.angle()

		position = ORIGIN
		rotation = 0
		rotate(rot)
		position = prev_pos
		print("Rotation: " + String(rotation))
	pass

func _physics_process(delta):
	move_and_slide(velocity)
	pass