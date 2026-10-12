extends RichTextLabel

func _process(_delta) -> void:
	$".".text = str(int(log(Globaltest.mouseoctave)/log(2) + 5))
