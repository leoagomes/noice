extends Camera2D

# Constants
const zoom_in_1 = Vector2(1.0, 1.0)
const zoom_out_1 = Vector2(2.75, 2.75)
const delta_zoom = Vector2(0.25, 0.25)

func _init():
	limit_bottom = Utils.map_limit.y
	limit_right = Utils.map_limit.x
	position = Vector2(limit_right, limit_bottom)/2 # Beginning at the centre of the map

func _input(event):
	# Right Mouse Button
	if Input.is_action_pressed("ui_mouse_right"):
		$Tween.interpolate_property(self, "position", position, get_global_mouse_position(), 
		0.75, Tween.TRANS_BACK, Tween.EASE_OUT)
		$Tween.start()

	# Zoom In/Wheel Up
	if Input.is_action_pressed("wheel_up") && zoom > zoom_in_1:
		$Tween.interpolate_property(self, "zoom", zoom, zoom - delta_zoom,
		0.25, Tween.TRANS_BACK, Tween.EASE_OUT)

	# Zoom Out/Wheel Down
	if Input.is_action_pressed("wheel_down") && zoom < zoom_out_1:
		$Tween.interpolate_property(self, "zoom", zoom, zoom + delta_zoom,
		0.25, Tween.TRANS_BACK, Tween.EASE_OUT)