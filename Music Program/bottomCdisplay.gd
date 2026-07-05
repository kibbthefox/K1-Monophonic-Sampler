extends TextEdit

func _process(_delta) -> void:
	$".".text = "C" + str(int(log(Globaltest.mouseoctave)/log(2) + 5))
