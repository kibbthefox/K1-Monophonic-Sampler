extends Button

func _on_pressed() -> void:
	if Globaltest.mouseoctave > .125:
		Globaltest.mouseoctave /= 2.0

func _process(_delta: float):
	if Input.is_action_just_pressed("octavedown"):
		Globaltest.mouseoctave /= 2.0
