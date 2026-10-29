extends RichTextLabel


func _process(_delta: float) -> void:
	if self.name == "Attack display":
		$".".text = str(Globaltest.attack) + " secs"
	elif self.name == "Decay dispay":
		$".".text = str(Globaltest.decay) + " secs"
	elif self.name == "Sustain display":
		$".".text = str(Globaltest.sustain) + "%"
	elif self.name == "Release display":
		$".".text = str(Globaltest.release) + " secs"
	elif self.name == "Octave Display":
		$".".text = str(int(log(Globaltest.mouseoctave)/log(2) + 5))
	elif self.name == "Midi display":
		if str(OS.get_connected_midi_inputs()) == "[]":
			$".".text = " No MIDI Keyboard Detected"
		else:
			$".".text = " MIDI Connected: " + str(OS.get_connected_midi_inputs())
	elif self.name == "Bottom C# display":
		$".".text = "C" + str(int(log(Globaltest.mouseoctave)/log(2) + 5))
	elif self.name == "Top C# display":
		$".".text = "C" + str(int(log(Globaltest.mouseoctave)/log(2) + 6))
