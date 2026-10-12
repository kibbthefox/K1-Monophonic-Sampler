extends Button

func _on_pressed() -> void:
	if Globaltest.mouseoctave < 8:
		Globaltest.mouseoctave *= 2

func _process(_delta: float):
	if Input.is_action_just_pressed("octaveup"):
		Globaltest.mouseoctave *= 2
