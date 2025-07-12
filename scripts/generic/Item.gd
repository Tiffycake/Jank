extends Node2D
class_name Item

func equip():
	show()
	process_mode = Node.PROCESS_MODE_INHERIT
	
func unequip():
	hide()
	process_mode = Node.PROCESS_MODE_DISABLED
