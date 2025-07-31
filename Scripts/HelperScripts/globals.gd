@tool
extends Node
#class_name Globals

var bodyColor : Color
var handsColor : Color
var username : String 

## balls
func loader(path: String, names: Array ,extension: String ) -> Dictionary: # , keys: String 
	var output_dict : Dictionary
	for i in names:
		output_dict.set(i,load(path+i+"."+extension))
	
	return output_dict
