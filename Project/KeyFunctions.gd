extends Area2D

var release:String = "deactivate"


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()


func on_click():
	if int(get_parent().name) < 13:
		$"../../../1".pitch_scale = Globaltest.pitcharray2[int(get_parent().name) - 1] * Globaltest.mouseoctave
	else:
		$"../../../1".pitch_scale = Globaltest.pitcharray2[int(get_parent().name) - 1] * 2 * Globaltest.mouseoctave
	Globaltest.lastpressed[int(self.name) - 1] = "mouse"
	Globaltest.releasehelper[int(self.name) - 1] = "standstill"
	Globaltest.keydown[0] = 60 + int(get_parent().name) - 1 + 12 * int(log(Globaltest.mouseoctave)/log(2))
	if Globaltest.attack > 0:
		$"../../../1".volume_db = -80
		Globaltest.attackhelper[int(self.name) - 1] = "attack"
	else:
		$"../../../1".volume_db = 0
	release = "activate"
	$"../../../1".play()


func _process(_delta: float) -> void:
	if release == "activate":
		if Input.is_action_just_released("leftbutton") and Globaltest.lastpressed[int(self.name) - 1] == "mouse":
			if Globaltest.lastpressed[int(self.name) - 1] == "mouse":
				Globaltest.keydown[0] = 0
			Globaltest.releasehelper[int(self.name) - 1] = "subtract"
			release = "deactivate"
