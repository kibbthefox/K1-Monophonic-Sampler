extends Node2D

var octave: int = 1
var calcpitch:int = 0
var keyboardoctave:float = 1

func _ready():
	OS.open_midi_inputs()
	print(OS.get_connected_midi_inputs())

func _input(input_event):
	if input_event is InputEventMIDI:
		_print_midi_info(input_event)

func _print_midi_info(midi_event):
	print('midi info ----------')
	print(midi_event)
	print("Pitch ", midi_event.pitch)
	print("Velocity ", midi_event.velocity)
	print('variables')
	print(octave)
	print(calcpitch)
	if midi_event.pitch - 60 > 11:
		octave = 2
		calcpitch = midi_event.pitch - 12
	elif midi_event.pitch - 60 > -1:
		octave = 1
		calcpitch = midi_event.pitch
	else:
		calcpitch = 0
	if calcpitch - 60 == 0 and midi_event.velocity> 0:
		$AudioStreamPlayer.pitch_scale = 1 * octave
		$AudioStreamPlayer.volume_db = midi_event.velocity / 6.35  -20
		$AudioStreamPlayer.play()
	if calcpitch - 60 == 1 and midi_event.velocity> 0:
		$AudioStreamPlayer.pitch_scale = 1.0595 * octave
		$AudioStreamPlayer.volume_db = midi_event.velocity / 6.35  -20
		$AudioStreamPlayer.play()
	if calcpitch - 60 == 2 and midi_event.velocity> 0:
		$AudioStreamPlayer.pitch_scale = 1.1225 * octave
		$AudioStreamPlayer.volume_db = midi_event.velocity / 6.35  -20
		$AudioStreamPlayer.play()
	if calcpitch - 60 == 3 and midi_event.velocity> 0:
		$AudioStreamPlayer.pitch_scale = 1.1892 * octave
		$AudioStreamPlayer.volume_db = midi_event.velocity / 6.35  -20
		$AudioStreamPlayer.play()
	if calcpitch - 60 == 4 and midi_event.velocity> 0:
		$AudioStreamPlayer.pitch_scale = 1.2599 * octave
		$AudioStreamPlayer.volume_db = midi_event.velocity / 6.35  -20
		$AudioStreamPlayer.play()
	if calcpitch - 60 == 5 and midi_event.velocity> 0:
		$AudioStreamPlayer.pitch_scale = 1.3348 * octave
		$AudioStreamPlayer.volume_db = midi_event.velocity / 6.35  -20
		$AudioStreamPlayer.play()
	if calcpitch - 60 == 6 and midi_event.velocity> 0:
		$AudioStreamPlayer.pitch_scale = 1.4142 * octave
		$AudioStreamPlayer.volume_db = midi_event.velocity / 6.35  -20
		$AudioStreamPlayer.play()
	if calcpitch - 60 == 7 and midi_event.velocity> 0:
		$AudioStreamPlayer.pitch_scale = 1.4983 * octave
		$AudioStreamPlayer.volume_db = midi_event.velocity / 6.35  -20
		$AudioStreamPlayer.play()
	if calcpitch - 60 == 8 and midi_event.velocity> 0:
		$AudioStreamPlayer.pitch_scale = 1.5874 * octave
		$AudioStreamPlayer.volume_db = midi_event.velocity / 6.35  -20
		$AudioStreamPlayer.play()
	if calcpitch - 60 == 9 and midi_event.velocity> 0:
		$AudioStreamPlayer.pitch_scale = 1.6818 * octave
		$AudioStreamPlayer.volume_db = midi_event.velocity / 6.35  -20
		$AudioStreamPlayer.play()
	if calcpitch - 60 == 10 and midi_event.velocity> 0:
		$AudioStreamPlayer.pitch_scale = 1.7818 * octave
		$AudioStreamPlayer.volume_db = midi_event.velocity / 6.35  -20
		$AudioStreamPlayer.play()
	if calcpitch - 60 == 11 and midi_event.velocity> 0:
		$AudioStreamPlayer.pitch_scale = 1.8877 * octave
		$AudioStreamPlayer.volume_db = midi_event.velocity / 6.35  -20
		$AudioStreamPlayer.play()

	
func _unhandled_key_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("z") == true:
		$AudioStreamPlayer.pitch_scale = 1 * keyboardoctave * .5
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("s") == true:
		$AudioStreamPlayer.pitch_scale = 1.0595 * keyboardoctave * .5
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("x") == true:
		$AudioStreamPlayer.pitch_scale = 1.1225 * keyboardoctave * .5
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("d") == true:
		$AudioStreamPlayer.pitch_scale = 1.1892 * keyboardoctave * .5
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("c") == true:
		$AudioStreamPlayer.pitch_scale = 1.2599 * keyboardoctave * .5
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("v") == true:
		$AudioStreamPlayer.pitch_scale = 1.3348 * keyboardoctave * .5
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("g") == true:
		$AudioStreamPlayer.pitch_scale = 1.4142 * keyboardoctave * .5
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("b") == true:
		$AudioStreamPlayer.pitch_scale = 1.4983 * keyboardoctave * .5
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("h") == true:
		$AudioStreamPlayer.pitch_scale = 1.5874 * keyboardoctave * .5
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("n") == true:
		$AudioStreamPlayer.pitch_scale = 1.6818 * keyboardoctave * .5
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("j") == true:
		$AudioStreamPlayer.pitch_scale = 1.7818 * keyboardoctave * .5
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("m") == true:
		$AudioStreamPlayer.pitch_scale = 1.8877 * keyboardoctave * .5
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed(",") == true or Input.is_action_just_pressed("q") == true:
		$AudioStreamPlayer.pitch_scale = 1 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("l") == true or Input.is_action_just_pressed("2") == true:
		$AudioStreamPlayer.pitch_scale = 1.0595 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed(".") == true or Input.is_action_just_pressed("w") == true:
		$AudioStreamPlayer.pitch_scale = 1.1225 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed(";") == true or Input.is_action_just_pressed("3") == true:
		$AudioStreamPlayer.pitch_scale = 1.1892 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("pianoe") == true or Input.is_action_just_pressed("e") == true:
		$AudioStreamPlayer.pitch_scale = 1.2599 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("r") == true:
		$AudioStreamPlayer.pitch_scale = 1.3348 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("5") == true:
		$AudioStreamPlayer.pitch_scale = 1.4142 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("t") == true:
		$AudioStreamPlayer.pitch_scale = 1.4983 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("6") == true:
		$AudioStreamPlayer.pitch_scale = 1.5874 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("y") == true:
		$AudioStreamPlayer.pitch_scale = 1.6818 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("7") == true:
		$AudioStreamPlayer.pitch_scale = 1.7818 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("u") == true:
		$AudioStreamPlayer.pitch_scale = 1.8877 * keyboardoctave
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("i") == true:
		$AudioStreamPlayer.pitch_scale = 1 * keyboardoctave * 2
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("9") == true:
		$AudioStreamPlayer.pitch_scale = 1.0595 * keyboardoctave * 2
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("o") == true:
		$AudioStreamPlayer.pitch_scale = 1.1225 * keyboardoctave * 2
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("0") == true:
		$AudioStreamPlayer.pitch_scale = 1.1892 * keyboardoctave * 2
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("p") == true:
		$AudioStreamPlayer.pitch_scale = 1.2599 * keyboardoctave * 2
		$AudioStreamPlayer.play()
	
func _process(_delta) -> void:
	if Input.is_action_just_pressed("octaveup") and keyboardoctave < 8:
		keyboardoctave *= 2
	if Input.is_action_just_pressed("octavedown") and keyboardoctave > .125:
		keyboardoctave /= 2.0
