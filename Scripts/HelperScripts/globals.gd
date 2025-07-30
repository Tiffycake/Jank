extends Node
#class_name Globals

var bodyColor : Color
var handsColor : Color
var username : String 

## balls
func loader(path: String, names: Array , keys: String ,extension: String ) -> Dictionary:
	var output_dict : Dictionary
	var coun : int = 0
	
	for i in names:
		
		output_dict.set(keys[coun],load(path+names[coun]+"."+extension))
		coun+=1
	
	return output_dict
