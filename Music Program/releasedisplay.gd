extends TextEdit

func _process(_delta: float) -> void:
	if Globaltest.release < 10.0:
		$".".text = "release: " + str(Globaltest.release) + " secs"
	else:
		$".".text = "release: inf"
