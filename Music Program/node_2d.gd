extends Node2D

var octave: int = 1
var calcpitch:int = 0

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
	
