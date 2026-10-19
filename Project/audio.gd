extends AudioStreamPlayer


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
	midioctave = 2.0 ** (midi_event.pitch/12 - 5)
	calcpitch = midi_event.pitch - (midi_event.pitch/12 - 5) * 12 - 60
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
		Globaltest.order[int(self.name) - 1] = Globaltest.orderhelp + 1
		Globaltest.keydown[int(self.name) - 1] = midi_event.pitch
		Globaltest.releasehelper[int(self.name) - 1] = "midistandstill"
		Globaltest.lastpressed[int(self.name) - 1] = "MIDI"
		lastmidipress = midi_event.pitch
		velocitycalc = midi_event.velocity / 6.35 - 17.5
		self.pitch_scale = Globaltest.pitcharray[calcpitch] * midioctave
	if midi_event.velocity == 0 and lastmidipress == midi_event.pitch:
		Globaltest.releasehelper[int(self.name) - 1] = "midiletgo"


func _process(_delta) -> void:
	if Input.is_action_just_released(lastinputpress) and Globaltest.lastpressed[int(self.name) - 1] == "keyboard":
		Globaltest.releasehelper[int(self.name) - 1] = "subtract"
		Globaltest.keydown[int(self.name) - 1] = 0
	if Globaltest.releasehelper[int(self.name) - 1] == "midiletgo" and Globaltest.lastpressed[int(self.name) - 1] == "MIDI":
		Globaltest.releasehelper[int(self.name) - 1] = "subtract"
		Globaltest.keydown[int(self.name) - 1] = 0
	if Globaltest.voice == int(self.name):
		for i in range(keyboardarr.size()):
			if Input.is_action_just_pressed(keyboardarr[i]):
				Globaltest.releasehelper[int(self.name) - 1] = "standstill"
				Globaltest.lastpressed[int(self.name) - 1] = "keyboard" 
				lastinputpress = keyboardarr[i]
				Globaltest.keydown[int(self.name) - 1] = 60 + keydownhelparr[i] + 12 * int(log(Globaltest.mouseoctave)/log(2))
				Globaltest.lastnote[int(self.name) - 1] = 60 + keydownhelparr[i] + 12 * int(log(Globaltest.mouseoctave)/log(2))
				if Globaltest.attack > 0:
					self.volume_db = Globaltest.volume - 80
					Globaltest.attackhelper[int(self.name) - 1] = "attack"
					self.play()
				else:
					self.volume_db = Globaltest.volume
					self.play()
				Globaltest.order[int(self.name) - 1] = Globaltest.orderhelp + 1
				self.pitch_scale = Globaltest.pitcharray[i] * Globaltest.mouseoctave * octavearr[i]


func _physics_process(_delta: float) -> void:
	if Globaltest.releasehelper[int(self.name) - 1] == "subtract" and Globaltest.release < 10:
		self.volume_db -= (8.0/6.0) / Globaltest.release
	if Globaltest.attackhelper[int(self.name) - 1] == "attack" and Globaltest.attack > 0 and self.volume_db < Globaltest.volume:
		if Globaltest.releasehelper[int(self.name) - 1] == "standstill" or Globaltest.releasehelper[int(self.name) - 1] == "midistandstill":
			if self.volume_db + (8.0/6.0) / Globaltest.attack > 0:
				self.volume_db = Globaltest.volume
			else:
				self.volume_db += (8.0/6.0) / Globaltest.attack
	elif self.volume_db >= Globaltest.volume:
		Globaltest.attackhelper[int(self.name) - 1] = "stop"
	if Globaltest.attackhelper[int(self.name) - 1] == "stop" and Globaltest.releasehelper[int(self.name) - 1] == "standstill" or Globaltest.releasehelper[int(self.name) - 1] == "midistandstill" \
	and Globaltest.attackhelper[int(self.name) - 1] == "stop":
		sustaincalc = (Globaltest.sustain/100.0 * 40)
		if self.volume_db - ((40 - sustaincalc)/60) / Globaltest.decay > (sustaincalc - 40):
			self.volume_db -= ((40 - sustaincalc)/60) / Globaltest.decay
		else:
			self.volume_db = (sustaincalc - 40)
	if self.volume_db < Globaltest.volume - 90:
		Globaltest.lastnote[int(self.name) - 1] = 0
		Globaltest.order[int(self.name) - 1] = 0
