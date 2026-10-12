extends Node

var mouseoctave = 1
var pitcharray = [1,1.0595,1.1225,1.1892,1.2599,1.3348,1.4142,1.4983,1.5874,1.6818,1.7818,1.8877,1,1.0595,1.1225,1.1892,1.2599,1,1.0595,1.1225,1.1892,1.2599,1.3348,1.4142,1.4983,1.5874,1.6818,1.7818,1.8877,1,1.0595,1.1225,1.1892,1.2599,]
var mouse_origin
var release:float
var releasehelper:String = "subtract"
var lastpressed:String = "none"
var lastmousepress
var attack:float = 0.0
var attackhelper:String = "stop"
var sustain:int
var decay:float = 1
var keytheme:int = 1
var keydown:int
var BGtheme:int = 1
var filetext:String = "Upload Audio File"
