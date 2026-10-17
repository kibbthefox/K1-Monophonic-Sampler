extends Node2D

#var midioctave: float = 1
#var calcpitch:int = 0
#
#var keyboardoctave:float = 1
#var keyboardarr:Array = ["z","s","x","d","c","v","g","b","h","n","j","m",",","l",".",";","pianoe","q","2","w","3","e","r","5","t","6","y","7","u","i","9","o","0","p"]
#var octavearr:Array = [1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,4,4,4,4,4]
#var keydownhelparr:Array = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]
#var lastinputpress:String = "z"
#var lastmidipress:int = 60
#var velocitycalc:float
#var sustaincalc:float = (Globaltest.sustain/100.0 * 80)
#var help
#
#
func _ready():
	OS.open_midi_inputs()
	print(OS.get_connected_midi_inputs())

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


func _input(input_event):
	if input_event is InputEventMIDI:
		_print_midi_info(input_event)


func _print_midi_info(midi_event):
	#print('midi info ----------')
	#print(midi_event)
	#print("Pitch ", midi_event.pitch)
	#print("Velocity ", midi_event.velocity)
	midioctave = 2.0 ** (midi_event.pitch/12 - 5)
	calcpitch = midi_event.pitch - (midi_event.pitch/12 - 5) * 12 - 60
	#print(midioctave)
	#print(calcpitch)
	if midioctave >= .125 and midioctave <= 8 and midi_event.velocity > 0 \
	and Globaltest.voice == int(self.name):
		if Globaltest.attack > 0:
			self.volume_db = Globaltest.volume - 80
			Globaltest.attackhelper[int(self.name) - 1] = "attack"
			self.play()
			print("attack")
		else:
			self.volume_db = Globaltest.volume
			self.play()
		Globaltest.keydown = midi_event.pitch
		Globaltest.releasehelper[int(self.name) - 1] = "midistandstill"
		Globaltest.lastpressed = "MIDI"
		lastmidipress = midi_event.pitch
		velocitycalc = midi_event.velocity / 6.35 - 17.5
		self.pitch_scale = Globaltest.pitcharray[calcpitch] * midioctave
		if Globaltest.voice < 8:
			Globaltest.voice = int(self.name) + 1
		elif Globaltest.voice == 8:
			Globaltest.voice = 0
	if midi_event.velocity == 0 and lastmidipress == midi_event.pitch:
		Globaltest.releasehelper[int(self.name) - 1] = "midiletgo"


func _process(_delta) -> void:
	if Input.is_action_just_pressed("octaveup") and keyboardoctave < 8:
		keyboardoctave *= 2
	if Input.is_action_just_pressed("octavedown") and keyboardoctave > .125:
		keyboardoctave /= 2.0
	if Input.is_action_just_pressed("leftbutton"):
		Globaltest.mouse_origin = get_global_mouse_position()
	if Input.is_action_just_released(lastinputpress) and Globaltest.lastpressed == "keyboard":
		Globaltest.releasehelper[int(self.name) - 1] = "subtract"
		Globaltest.keydown = 0
	if Globaltest.releasehelper[int(self.name) - 1] == "midiletgo" and Globaltest.lastpressed == "MIDI":
		Globaltest.releasehelper[int(self.name) - 1] = "subtract"
		Globaltest.keydown = 0
	if Globaltest.voice == int(self.name):
		for i in range(keyboardarr.size()):
			if Input.is_action_just_pressed(keyboardarr[i]):
				Globaltest.releasehelper[int(self.name) - 1] = "standstill"
				Globaltest.lastpressed = "keyboard" 
				lastinputpress = keyboardarr[i]
				Globaltest.keydown = 60 + keydownhelparr[i] + 12 * int(log(Globaltest.mouseoctave)/log(2))
				if Globaltest.attack > 0:
					self.volume_db = Globaltest.volume - 80
					Globaltest.attackhelper[int(self.name) - 1] = "attack"
					self.play()
				else:
					self.volume_db = Globaltest.volume
					self.play()
				self.pitch_scale = Globaltest.pitcharray[i] * Globaltest.mouseoctave * octavearr[i]
				if Globaltest.voice < 8:
					Globaltest.voice = int(self.name) + 1
				elif Globaltest.voice == 8:
					Globaltest.voice = 0




#
#func _input(input_event):
	#if input_event is InputEventMIDI:
		#_print_midi_info(input_event)
#
#
#func _print_midi_info(midi_event):
	##print('midi info ----------')
	##print(midi_event)
	##print("Pitch ", midi_event.pitch)
	##print("Velocity ", midi_event.velocity)
	#midioctave = 2.0 ** (midi_event.pitch/12 - 5)
	#calcpitch = midi_event.pitch - (midi_event.pitch/12 - 5) * 12 - 60
	##print(midioctave)
	##print(calcpitch)
	#if midioctave >= .125 and midioctave <= 8 and midi_event.velocity > 0:
		#if Globaltest.attack > 0:
			#$AudioStreamPlayer.volume_db = -80
			#Globaltest.attackhelper = "attack"
			#$AudioStreamPlayer.play()
			#print("attack")
		#else:
			#$AudioStreamPlayer.volume_db = 0
			#$AudioStreamPlayer.play()
		#Globaltest.keydown = midi_event.pitch
		#Globaltest.releasehelper = "midistandstill"
		#Globaltest.lastpressed = "MIDI"
		#lastmidipress = midi_event.pitch
		#velocitycalc = midi_event.velocity / 6.35 - 17.5
		#$AudioStreamPlayer.pitch_scale = Globaltest.pitcharray[calcpitch] * midioctave
	#if midi_event.velocity == 0 and lastmidipress == midi_event.pitch:
		#Globaltest.releasehelper = "midiletgo"
	#
#
func _process(_delta) -> void:
	#if Input.is_action_just_pressed("octaveup") and keyboardoctave < 8:
		#keyboardoctave *= 2
	#if Input.is_action_just_pressed("octavedown") and keyboardoctave > .125:
		#keyboardoctave /= 2.0
	if Input.is_action_just_pressed("leftbutton"):
		Globaltest.mouse_origin = get_global_mouse_position()
	#if Input.is_action_just_released(lastinputpress) and Globaltest.lastpressed == "keyboard":
		#Globaltest.releasehelper = "subtract"
		#Globaltest.keydown = 0
	#if Globaltest.releasehelper == "midiletgo" and Globaltest.lastpressed == "MIDI":
		#Globaltest.releasehelper = "subtract"
		#Globaltest.keydown = 0
	#for i in range(keyboardarr.size()):
		#if Input.is_action_just_pressed(keyboardarr[i]):
			#Globaltest.releasehelper = "standstill"
			#Globaltest.lastpressed = "keyboard" 
			#lastinputpress = keyboardarr[i]
			#Globaltest.keydown = 60 + keydownhelparr[i] + 12 * int(log(Globaltest.mouseoctave)/log(2))
			#if Globaltest.attack > 0:
				#$AudioStreamPlayer.volume_db = -80
				#Globaltest.attackhelper = "attack"
				#$AudioStreamPlayer.play()
			#else:
				#$AudioStreamPlayer.volume_db = 0
				#$AudioStreamPlayer.play()
			#$AudioStreamPlayer.pitch_scale = Globaltest.pitcharray[i] * Globaltest.mouseoctave * octavearr[i]
			#
			#
			#
#
#func _physics_process(_delta: float) -> void:
	#if Globaltest.releasehelper == "subtract" and Globaltest.release < 10:
		#$AudioStreamPlayer.volume_db -= (8.0/6.0) / Globaltest.release
	#if Globaltest.attackhelper == "attack" and Globaltest.attack > 0 and $AudioStreamPlayer.volume_db < 0:
		#if Globaltest.releasehelper == "standstill" or Globaltest.releasehelper == "midistandstill":
			#if $AudioStreamPlayer.volume_db + (8.0/6.0) / Globaltest.attack > 0:
				#$AudioStreamPlayer.volume_db = 0
			#else:
				#$AudioStreamPlayer.volume_db += (8.0/6.0) / Globaltest.attack
	#elif $AudioStreamPlayer.volume_db >= 0:
		#Globaltest.attackhelper = "stop"
	#if Globaltest.attackhelper == "stop" and Globaltest.releasehelper == "standstill" or Globaltest.releasehelper == "midistandstill" \
	#and Globaltest.attackhelper == "stop":
		#sustaincalc = (Globaltest.sustain/100.0 * 40)
		#if $AudioStreamPlayer.volume_db - ((40 - sustaincalc)/60) / Globaltest.decay > (sustaincalc - 40):
			#$AudioStreamPlayer.volume_db -= ((40 - sustaincalc)/60) / Globaltest.decay
		#else:
			#$AudioStreamPlayer.volume_db = (sustaincalc - 40)
			#
