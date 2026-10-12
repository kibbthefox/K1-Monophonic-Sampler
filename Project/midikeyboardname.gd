extends RichTextLabel

func _process(_delta: float) -> void:
	if str(OS.get_connected_midi_inputs()) == "[]":
		$".".text = " No MIDI Keyboard Detected"
	else:
		$".".text = " MIDI Connected: " + str(OS.get_connected_midi_inputs())
