extends Node
#Globals
var bodyColor : Color
var handsColor : Color
var username : String 

var resource_dict : Dictionary 



# funny ideas
# Callable.create()
 

func _ready() -> void:
	resource_loader("res://resources/textures/zombs/Bullets/" , ["small","medium","heavy","shell"], "png","bullets")

func get_relevant_property_list(resource : Resource, filter : Array ):
	#var is_blacklist : bool = true 
	# if blacklist is false just  [[ filter = reals ]]
	
	var script		: Script = resource.get_script()
	
	var _content_array	: Array[Dictionary] = resource.get_property_list()
	var prop_list		: Array[Dictionary] = script.get_script_property_list()
	var out_list		: Array#[Dictionary]
	
	
	#run_once(content_array,prety_print,1)
	#run_once("\n",print,3)
	#run_once(prop_list,prety_print,2)
	 
	for i in prop_list:
		var name1 : String = i["name"]
		
		if !(name1 in filter):
			out_list.append(resource.get(name1))
		#else:
			#pass #prop_list.erase(i)
	

	return out_list

func bolasa(sheet : stat_sheet): # turns a stat sheet into a string list of the key and value pairs
	var tooltip : String = ""
	
	#for a in get_relevant_property_list(sheet,["offset","weaponSprite","stats.gd"]):
		#tooltip += str(a) + " : " + str(sheet.get(a)) + "\n"
	
	var content_array = get_relevant_property_list(sheet,["offset","weaponSprite","stats.gd"])
	#run_once(content_array,prety_print,1)
	
	for i in content_array:
		tooltip += str(i) + "\n"
	#run_once( get_relevant_property_list(sheet,["offset","weaponSprite","stats.gd"]) , prety_print ,1)
	#for i in sheet.get_property_list(): # get_property_list 
		#tooltip += a + " : " + str(sheet.get(a)) + "\n"
	return tooltip

func resource_loader(path: String ,names: Array ,extension: String ,key: String): # , keys: String 
	var output_dict : Dictionary
	for i in names:
		output_dict.set(i,load(path+i+"."+extension))
	
	resource_dict.set(key,output_dict)
	
	#return output_dict

# wtf 
func recursive_iter(a):
	if a is Array :
		for i in a:
			recursive_iter(i)
	else:
		return a
		
		
		
func prety_print(args):
	for i in args:
		print (i)

#var real_dic : Dictionary
#func run_once(variant:Variant , callable:Callable, num:int): # this is so smart
	#
	#if ! (real_dic.has(num)):
		#callable.call(variant)
		#real_dic.set(num,num)
