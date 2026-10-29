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
var mostrecentpitch
var pitchscale


func playnote():
	calcpitch = mostrecentpitch - (mostrecentpitch/12 - 5) * 12 - 60
	if Globaltest.attack > 0:
		self.volume_db = Globaltest.volume - 80
		Globaltest.attackhelper[int(self.name) - 1] = "attack"
		self.play()
	else:
		self.volume_db = Globaltest.volume
		self.play()
	Globaltest.order[int(self.name) - 1] = Globaltest.orderhelp + 1
	Globaltest.keydown[int(self.name) - 1] = mostrecentpitch
	Globaltest.lastnote[int(self.name) - 1] = mostrecentpitch
	if Globaltest.which == 1:
		midioctave = 2.0 ** (mostrecentpitch/12 - 5)
		Globaltest.releasehelper[int(self.name) - 1] = "midistandstill"
		Globaltest.lastpressed[int(self.name) - 1] = "MIDI"
		self.pitch_scale = Globaltest.pitcharray[calcpitch] * midioctave
	elif Globaltest.which == 2:
		Globaltest.releasehelper[int(self.name) - 1] = "standstill"
		Globaltest.lastpressed[int(self.name) - 1] = "keyboard"
		for i in range(keyboardarr.size()):
			if Input.is_action_just_pressed(keyboardarr[i]):
				lastinputpress = keyboardarr[i]
				self.pitch_scale = Globaltest.pitcharray[i] * Globaltest.mouseoctave * octavearr[i]
	else:
		Globaltest.releasehelper[int(self.name) - 1] = "standstill"
		Globaltest.lastpressed[int(self.name) - 1] = "mouse"
		self.pitch_scale = pitchscale


func _process(_delta) -> void:
	if Input.is_action_just_released(lastinputpress) and Globaltest.lastpressed[int(self.name) - 1] == "keyboard":
		Globaltest.releasehelper[int(self.name) - 1] = "subtract"
		Globaltest.keydown[int(self.name) - 1] = 0
	if Globaltest.releasehelper[int(self.name) - 1] == "midiletgo" and Globaltest.lastpressed[int(self.name) - 1] == "MIDI":
		Globaltest.releasehelper[int(self.name) - 1] = "subtract"
		Globaltest.keydown[int(self.name) - 1] = 0
	if Globaltest.voice == int(self.name) and 1 == 2:
		for i in range(keyboardarr.size()):
			if Input.is_action_just_pressed(keyboardarr[i]):
				Globaltest.releasehelper[int(self.name) - 1] = "standstill"
				Globaltest.lastpressed[int(self.name) - 1] = "keyboard" 
				lastinputpress = keyboardarr[i]
				Globaltest.keydown[int(self.name) - 1] = 60 + keydownhelparr[i] + 12 * int(log(Globaltest.mouseoctave)/log(2))
				#Globaltest.lastnote[int(self.name) - 1] = 60 + keydownhelparr[i] + 12 * int(log(Globaltest.mouseoctave)/log(2))
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
	if Globaltest.releasehelper[int(self.name) - 1] == "subtract":
		self.volume_db -= (8.0/6.0) / Globaltest.release
		if self.volume_db < Globaltest.volume - 90:
			Globaltest.lastnote[int(self.name) - 1] = 0
			Globaltest.order[int(self.name) - 1] = 0
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
