extends RichTextLabel

func _process(_delta: float) -> void:
	if Globaltest.release < 10.0:
		$".".text = str(Globaltest.release) + " secs"
	else:
		$".".text = "inf"
