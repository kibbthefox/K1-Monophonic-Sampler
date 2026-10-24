extends Area2D

var release:String = "deactivate"
var pitch
var pitchscale = 1
var voice = 0


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()


func on_click():
	if int(get_parent().name) < 13:
		pitchscale = Globaltest.pitcharray2[int(get_parent().name) - 1] * Globaltest.mouseoctave
	else:
		pitchscale = Globaltest.pitcharray2[int(get_parent().name) - 1] * 2 * Globaltest.mouseoctave
	pitch = 60 + int(get_parent().name) - 1 + 12 * int(log(Globaltest.mouseoctave)/log(2))
	if Globaltest.lastnote.has(pitch):
		Globaltest.voice = Globaltest.lastnote.find(pitch) + 1
	elif Globaltest.lastnote.has(0):
		Globaltest.voice = Globaltest.lastnote.find(0) + 1
	else:
		Globaltest.voice = Globaltest.order.find(Globaltest.order.filter(func(n): return n != 0).min()) + 1
	Globaltest.orderhelp += 1
	Globaltest.order[Globaltest.voice -1] = Globaltest.orderhelp
	Globaltest.which = 3
	voice = Globaltest.voice - 1
	release = "activate"
	get_tree().root.get_node("Node2D").get_node(str(Globaltest.voice)).set("mostrecentpitch", pitch)
	get_tree().root.get_node("Node2D").get_node(str(Globaltest.voice)).set("pitchscale", pitchscale)
	get_tree().root.get_node("Node2D").get_node(str(Globaltest.voice)).playnote()


func _process(_delta: float) -> void:
	if release == "activate":
		if Input.is_action_just_released("leftbutton") and Globaltest.lastpressed[voice] == "mouse":
			Globaltest.keydown[voice] = 0
			Globaltest.releasehelper[voice] = "subtract"
			release = "deactivate"
			voice = 0
