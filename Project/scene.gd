extends Node2D

var midioctave: float = 1
var calcpitch:int = 0
var keyboardoctave:float = 1
var keyboardarr:Array = ["z","s","x","d","c","v","g","b","h","n","j","m",",","l",".",";","pianoe","q","2","w","3","e","r","5","t","6","y","7","u","i","9","o","0","p"]
var octavearr:Array = [1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,4,4,4,4,4]
var keydownhelparr:Array = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]
var lastinputpress:String = "z"
var lastmidipress:int = 60
var velocitycalc:float
var sustaincalc:float = (Globaltest.sustain/100.0 * 80)
var help
var midipitch
var orderfilter
var keyboardpitch


func _ready():
	OS.open_midi_inputs()
	print(OS.get_connected_midi_inputs())


func _input(input_event):
	if input_event is InputEventMIDI:
		_print_midi_info(input_event)


func _print_midi_info(midi_event):
	midioctave = 2.0 ** (midi_event.pitch/12 - 5)
	calcpitch = midi_event.pitch - (midi_event.pitch/12 - 5) * 12 - 60
	if midioctave >= .125 and midioctave <= 16 and midi_event.velocity > 0:
		midipitch = midi_event.pitch
		if Globaltest.lastnote.has(midipitch):
			Globaltest.voice = Globaltest.lastnote.find(midipitch) + 1
		elif Globaltest.lastnote.has(0):
			Globaltest.voice = Globaltest.lastnote.find(0) + 1
		else:
			Globaltest.voice = Globaltest.order.find(Globaltest.order.filter(func(n): return n != 0).min()) + 1
		Globaltest.orderhelp += 1
		Globaltest.order[Globaltest.voice -1] = Globaltest.orderhelp
		Globaltest.which = 1
		get_node(str(Globaltest.voice)).set("mostrecentpitch", midipitch)
		get_node(str(Globaltest.voice)).playnote()
		lastmidipress = midi_event.pitch
	if midi_event.velocity == 0 and Globaltest.lastnote.has(midi_event.pitch):
		Globaltest.releasehelper[Globaltest.lastnote.find(midi_event.pitch)] = "midiletgo"


func _process(_delta) -> void:
	orderfilter = Globaltest.order.find(Globaltest.order.filter(func(n): return n != 0).min())
	if Input.is_action_just_pressed("octaveup") and keyboardoctave < 8:
		keyboardoctave *= 2
	if Input.is_action_just_pressed("octavedown") and keyboardoctave > .125:
		keyboardoctave /= 2.0
	if Input.is_action_just_pressed("leftbutton"):
		Globaltest.mouse_origin = get_global_mouse_position()
	for i in range(keyboardarr.size()):
		if Input.is_action_just_pressed(keyboardarr[i]):
			keyboardpitch = 60 + keydownhelparr[i] + 12 * int(log(Globaltest.mouseoctave)/log(2))
			if Globaltest.lastnote.has(keyboardpitch):
				Globaltest.voice = Globaltest.lastnote.find(keyboardpitch) + 1
			elif Globaltest.lastnote.has(0):
				Globaltest.voice = Globaltest.lastnote.find(0) + 1
			else:
				Globaltest.voice = Globaltest.order.find(Globaltest.order.filter(func(n): return n != 0).min()) + 1
			Globaltest.orderhelp += 1
			Globaltest.order[Globaltest.voice -1] = Globaltest.orderhelp
			Globaltest.which = 2
			get_node(str(Globaltest.voice)).set("mostrecentpitch", keyboardpitch)
			get_node(str(Globaltest.voice)).playnote()
			lastinputpress = keyboardarr[i]
