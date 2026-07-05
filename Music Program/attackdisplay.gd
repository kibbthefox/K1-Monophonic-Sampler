extends TextEdit

func _process(_delta: float) -> void:
		$".".text = "attack: " + str(Globaltest.attack) + " secs"
