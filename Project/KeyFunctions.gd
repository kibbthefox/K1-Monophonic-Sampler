extends Area2D

var release:String = "deactivate"


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()


func on_click():
	if int(get_parent().name) < 13:
		$"../../../AudioStreamPlayer".pitch_scale = Globaltest.pitcharray2[int(get_parent().name) - 1] * Globaltest.mouseoctave
	else:
		$"../../../AudioStreamPlayer".pitch_scale = Globaltest.pitcharray2[int(get_parent().name) - 1] * 2 * Globaltest.mouseoctave
	Globaltest.lastpressed = "mouse"
	Globaltest.releasehelper = "standstill"
	Globaltest.keydown = 60 + int(get_parent().name) - 1 + 12 * int(log(Globaltest.mouseoctave)/log(2))
	if Globaltest.attack > 0:
		$"../../../AudioStreamPlayer".volume_db = -80
		Globaltest.attackhelper = "attack"
	else:
		$"../../../AudioStreamPlayer".volume_db = 0
	release = "activate"
	$"../../../AudioStreamPlayer".play()


func _process(_delta: float) -> void:
	if release == "activate":
		if Input.is_action_just_released("leftbutton") and Globaltest.lastpressed == "mouse":
			if Globaltest.lastpressed == "mouse":
				Globaltest.keydown = 0
			Globaltest.releasehelper = "subtract"
			release = "deactivate"
