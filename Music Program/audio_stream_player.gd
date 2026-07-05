#	for i in range(keyboardarr1.size()):
#		if Input.is_action_just_released(keyboardarr1[i]):
#			Globaltest.releasehelper = false
#			button_down = false
#	for i in range(keyboardarr2.size()):
#		if Input.is_action_just_released(keyboardarr2[i]):
#			Globaltest.releasehelper = false
#			button_down = false

#	for i in range(keyboardarr2.size()):
#		if Input.is_action_just_pressed(keyboardarr2[i]):
#			Globaltest.lastpressed = "keyboard"
#			Globaltest.releasehelper = "standstill"
#			lastinputpress = keyboardarr2[i]
#			$AudioStreamPlayer.pitch_scale = Globaltest.pitcharray[i] * keyboardoctave *octavearr2[i]
#			if Globaltest.attack > 0:
#				$AudioStreamPlayer.volume_db = -80
#				Globaltest.attackhelper = "attack"
#			else:
#				$AudioStreamPlayer.volume_db = 0
#			$AudioStreamPlayer.play()

	if Input.is_action_just_pressed("z") == true:
		$AudioStreamPlayer.pitch_scale = 1 * keyboardoctave
		if Globaltest.attack > 0:
				$AudioStreamPlayer.volume_db = -80
				Globaltest.attackhelper = "attack"
			else:
				$AudioStreamPlayer.volume_db = 0
	$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("s") == true:
		$AudioStreamPlayer.pitch_scale = 1.0595 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("x") == true:
		$AudioStreamPlayer.pitch_scale = 1.1225 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("d") == true:
		$AudioStreamPlayer.pitch_scale = 1.1892 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("c") == true:
		$AudioStreamPlayer.pitch_scale = 1.2599 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("v") == true:
		$AudioStreamPlayer.pitch_scale = 1.3348 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("g") == true:
		$AudioStreamPlayer.pitch_scale = 1.4142 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("b") == true:
		$AudioStreamPlayer.pitch_scale = 1.4983 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("h") == true:
		$AudioStreamPlayer.pitch_scale = 1.5874 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("n") == true:
		$AudioStreamPlayer.pitch_scale = 1.6818 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("j") == true:
		$AudioStreamPlayer.pitch_scale = 1.7818 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("m") == true:
		$AudioStreamPlayer.pitch_scale = 1.8877 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed(",") == true or Input.is_action_just_pressed("q") == true:
		$AudioStreamPlayer.pitch_scale = 1 * keyboardoctave * 2
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("l") == true or Input.is_action_just_pressed("2") == true:
		$AudioStreamPlayer.pitch_scale = 1.0595 * keyboardoctave * 2
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed(".") == true or Input.is_action_just_pressed("w") == true:
		$AudioStreamPlayer.pitch_scale = 1.1225 * keyboardoctave * 2
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed(";") == true or Input.is_action_just_pressed("3") == true:
		$AudioStreamPlayer.pitch_scale = 1.1892 * keyboardoctave * 2
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("pianoe") == true or Input.is_action_just_pressed("e") == true:
		$AudioStreamPlayer.pitch_scale = 1.2599 * keyboardoctave * 2
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("r") == true:
		$AudioStreamPlayer.pitch_scale = 1.3348 * keyboardoctave * 2
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("5") == true:
		$AudioStreamPlayer.pitch_scale = 1.4142 * keyboardoctave * 2
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("t") == true:
		$AudioStreamPlayer.pitch_scale = 1.4983 * keyboardoctave * 2
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("6") == true:
		$AudioStreamPlayer.pitch_scale = 1.5874 * keyboardoctave * 2
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("y") == true:
		$AudioStreamPlayer.pitch_scale = 1.6818 * keyboardoctave * 2
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("7") == true:
		$AudioStreamPlayer.pitch_scale = 1.7818 * keyboardoctave * 2
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("u") == true:
		$AudioStreamPlayer.pitch_scale = 1.8877 * keyboardoctave * 2
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("i") == true:
		$AudioStreamPlayer.pitch_scale = 1 * keyboardoctave * 4
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("9") == true:
		$AudioStreamPlayer.pitch_scale = 1.0595 * keyboardoctave * 4
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("o") == true:
		$AudioStreamPlayer.pitch_scale = 1.1225 * keyboardoctave * 4
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("0") == true:
		$AudioStreamPlayer.pitch_scale = 1.1892 * keyboardoctave * 4
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("p") == true:
		$AudioStreamPlayer.pitch_scale = 1.2599 * keyboardoctave * 4
		$AudioStreamPlayer.play()
