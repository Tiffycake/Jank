extends Node2D
class_name Item
## item instance


func equip():
	get_node_or_null("Sprite2D").show()
	process_mode = Node.PROCESS_MODE_INHERIT

func unequip():
	get_node_or_null("Sprite2D").hide()
	process_mode = Node.PROCESS_MODE_DISABLED
