extends TextEdit

var keyboardoctave = 5
var keyocthelper:String

func _process(_delta) -> void:
	if Input.is_action_just_pressed("octaveup") and keyboardoctave < 8:
		keyboardoctave += 1
	if Input.is_action_just_pressed("octavedown") and keyboardoctave > 2:
		keyboardoctave -= 1
	$".".text = "keyboard octave: " + str(keyboardoctave)
