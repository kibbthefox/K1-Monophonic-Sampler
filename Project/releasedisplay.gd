extends RichTextLabel

func _process(_delta: float) -> void:
	$".".text = str(Globaltest.release) + " secs"
