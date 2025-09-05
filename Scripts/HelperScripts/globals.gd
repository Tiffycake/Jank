extends Node
class_name balls_lol # this is true

var bodyColor : Color
var handsColor : Color
var username : String 

var resource_dict : Dictionary 

 

func _ready() -> void:
	resource_loader("res://resources/textures/zombs/Bullets/" , ["small","medium","heavy","shell"], "png","bullets")



# get stat what
# script ->

func bolasa(sheet : stat_sheet):
	var tooltip : String = ""
	var sheet_script : Script = sheet.get_script()
	var a  : String
	
	for i in sheet_script.get_script_property_list():
		print("skibidi: ", i)
	
	for i in sheet.get_property_list(): # get_property_list 
		a = i["name"]
		
		if i["usage"] == 4102 and !( a in ["script","weaponSprite","offset"]): # terrible checking
		
			tooltip += a + " : " + str(sheet.get(a)) + "\n"
	return tooltip


func resource_loader(path: String ,names: Array ,extension: String ,key: String): # , keys: String 
	var output_dict : Dictionary
	for i in names:
		output_dict.set(i,load(path+i+"."+extension))
	
	resource_dict.set(key,output_dict)
	
	#return output_dict
