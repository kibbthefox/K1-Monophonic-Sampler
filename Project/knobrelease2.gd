extends AnimatedSprite2D

var distancesqr:float
var mousepos
var clickhelper = 1
var currentrotate = 0
var rrotate
var helper
var limit:float = 38 * PI / 56

func _ready():
	rrotate = 0
	currentrotate = 0


func _process(_delta: float) -> void:
	helper = int(27 - 27 * rrotate / (PI / 2))
	frame = helper + 27 * floor(rrotate / (PI / 2))
	if helper >= 54:
		$".".rotation = PI / -2
	if helper >= 27 and helper < 54:
		$".".rotation = 0
	if helper >= 0 and helper < 27:
		$".".rotation = PI / 2
	if helper >= -27 and helper < 0:
		$".".rotation = PI
	distancesqr = get_global_mouse_position().distance_squared_to($".".global_position)
	if distancesqr < 1600 * clickhelper and Input.is_action_pressed("leftbutton") == true:
		clicked()
	if Input.is_action_just_released("leftbutton") == true:
		currentrotate = rrotate
		clickhelper = 1
	Globaltest.release = float(int((currentrotate/limit + 1) * 50)) / 10
		
func clicked():
		mousepos = get_global_mouse_position()
		clickhelper = 100000000
		if rrotate <= limit and rrotate >= -1 * limit:
			rrotate = currentrotate + (Globaltest.mouse_origin[1] - mousepos[1]) /60
		if rrotate < -1 * limit:
			rrotate = -1 * limit
		if rrotate > limit:
			rrotate = limit
