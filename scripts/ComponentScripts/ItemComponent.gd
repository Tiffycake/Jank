extends Node2D
class_name invItem
 
@export var texture : Texture2D 
@export var nameId : String 

func equiped():
	show()
	process_mode = Node.PROCESS_MODE_INHERIT
	
func unEquiped():
	hide() 
	process_mode = Node.PROCESS_MODE_DISABLED
