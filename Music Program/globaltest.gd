extends Node

var mouseoctave = 1
var pitcharray = [1,1.0595,1.1225,1.1892,1.2599,1.3348,1.4142,1.4983,1.5874,1.6818,1.7818,1.8877,1,1.0595,1.1225,1.1892,1.2599,1,1.0595,1.1225,1.1892,1.2599,1.3348,1.4142,1.4983,1.5874,1.6818,1.7818,1.8877,1,1.0595,1.1225,1.1892,1.2599,]
var mouse_origin
var release:float
var releasehelper:String = "waiting"
var lastpressed:String = "none"
var lastmousepress
var attack:float
var attackhelper:String = "waiting"
