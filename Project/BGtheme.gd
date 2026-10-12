extends Area2D


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		self.onclick()

func onclick():
	if Globaltest.BGtheme == 1:
		$"..".frame = 0
		$"../../Rainbow BG".visible = false
		$"../../rainbowtext".visible = false
		$"../../Purple BG".visible = true
		Globaltest.BGtheme = 2
	else:
		$"..".frame = 1
		$"../../Rainbow BG".visible = true
		$"../../rainbowtext".visible = true
		$"../../Purple BG".visible = false
		Globaltest.BGtheme = 1
