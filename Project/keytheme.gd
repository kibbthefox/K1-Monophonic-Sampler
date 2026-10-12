extends AnimatedSprite2D

func _process(_delta: float) -> void:
	if Globaltest.keytheme == 2:
		frame = 1
	if Globaltest.keytheme == 1:
		frame = 0	
	
