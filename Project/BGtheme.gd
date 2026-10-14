extends Area2D

var BGtheme:int = 2

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		self.onclick()

func onclick():
	if BGtheme == 1:
		$"..".frame = 0
		$"../../Rainbow BG".visible = false
		$"../../rainbowtext".visible = false
		$"../../Purple BG".visible = true
		BGtheme = 2
	else:
		$"..".frame = 1
		$"../../Rainbow BG".visible = true
		$"../../rainbowtext".visible = true
		$"../../Purple BG".visible = false
		BGtheme = 1
