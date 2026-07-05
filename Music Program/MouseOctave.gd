extends TextEdit

func _process(_delta) -> void:
	$".".text = "mouse octave: " + str(int(log(Globaltest.mouseoctave)/log(2) + 5))
