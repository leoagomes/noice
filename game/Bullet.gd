extends KinematicBody2D

var speed = 1
var motion = Vector2(0, 0)
var collision
var damage = 10

func _init():
	setup(10, 10)
	pass

func setup(x, y):
	rotate(deg2rad(10))
	position.x = x
	position.y = y
	pass

func _physics_process(delta):
	if collision:
		#print("colidiu")
		# TODO: damage the base
		free()
	else:
		# Calculates the components of the motion
		motion.x = cos(rotation)*speed
		motion.y = sin(rotation)*speed
		collision = move_and_collide(motion)

	pass
