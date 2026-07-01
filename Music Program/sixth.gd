extends Area2D

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()
func on_click():
	$"../../AudioStreamPlayer".pitch_scale = 1.6818
	$"../../AudioStreamPlayer".play()
