extends Node

## Constants ##
# Origin
const ORIGIN = Vector2(0, 0)
# x: limit_right
# y: limit_bottom
var map_limit = Vector2(5000, 2500)

enum Type {
	SHIP = 0,
	BASE
}

# Enums
enum Team {
	A = 0,
	B,
	C,
	D,
	E,
	NEUTRAL
}

static func is_in_range(obj_pos, target_pos, r):
	var l_x = (obj_pos.x <= (target_pos.x + r)) && (obj_pos.x >= (target_pos.x - r))
	var l_y = (obj_pos.y <= (target_pos.y + r)) && (obj_pos.y >= (target_pos.y - r))
	return l_x && l_y

	pass