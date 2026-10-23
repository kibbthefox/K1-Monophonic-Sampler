extends AnimatedSprite2D


func _process(_delta: float) -> void:
	if Globaltest.keydown.has(60 + int(self.name) - 1 + 12 * int(log(Globaltest.mouseoctave)/log(2))):
		frame = 1
	elif Globaltest.keytheme == 2:
		frame = 2
	else:
		frame = 0
