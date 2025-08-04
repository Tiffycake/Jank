extends Node
#class_name Globals # this is true

var bodyColor : Color
var handsColor : Color
var username : String 

var resource_dict : Dictionary 

## balls

func _ready() -> void:
	loader("res://resources/textures/zombs/Bullets/" , ["small","medium","heavy","shell"], "png","bullets")


func loader(path: String ,names: Array ,extension: String ,key: String): # , keys: String 
	var output_dict : Dictionary
	for i in names:
		output_dict.set(i,load(path+i+"."+extension))
	
	resource_dict.set(key,output_dict)
	
	#return output_dict
