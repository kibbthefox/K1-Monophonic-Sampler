extends Area2D

var frame:int = 0

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		self.onclick()
		
func onclick():
	if Globaltest.keytheme == 1:
		Globaltest.keytheme = 2
	elif Globaltest.keytheme == 2:
		Globaltest.keytheme = 1
	
