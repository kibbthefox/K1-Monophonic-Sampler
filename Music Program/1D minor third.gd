extends Area2D

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()
func on_click():
	$"../../../AudioStreamPlayer".pitch_scale = 1.1892 * Globaltest.mouseoctave
	Globaltest.lastpressed = "mouse"
	Globaltest.releasehelper = "standstill"
	if Globaltest.attack > 0:
		$"../../../AudioStreamPlayer".volume_db = -80
		Globaltest.attackhelper = "attack"
	else:
		$"../../../AudioStreamPlayer".volume_db = 0
	release = "activate"
	$"../../../AudioStreamPlayer".play()

var release:String = "deactivate"

func _process(_delta: float) -> void:
	if release == "activate":
		if Input.is_action_just_released("leftbutton") and Globaltest.lastpressed == "mouse":
			Globaltest.releasehelper = "subtract"
			release = "deactivate"
	
