extends Sprite2D

var distancesqr:float
var mousepos
var clickhelper = 1
var currentrotate = 0

func _ready():
	$".".rotation = 0
	currentrotate = 0

func _process(_delta: float) -> void:
	distancesqr = get_global_mouse_position().distance_squared_to($".".global_position)
	if distancesqr < 1600 * clickhelper and Input.is_action_pressed("leftbutton") == true:
		clicked()
	if Input.is_action_just_released("leftbutton") == true:
		currentrotate = $".".rotation
		clickhelper = 1
	Globaltest.release = float(int((currentrotate/2.09999990463256 + 1) * 50)) / 10

func clicked():
		mousepos = get_global_mouse_position()
		clickhelper = 100000000
		if $".".rotation <= 2.1 and $".".rotation >= -2.1:
			$".".rotation = currentrotate + (Globaltest.mouse_origin[1] - mousepos[1]) /60
		if $".".rotation < -2.1:
			$".".rotation = -2.1
		if $".".rotation > 2.1:
			$".".rotation = 2.1
		
