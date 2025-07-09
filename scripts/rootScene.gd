extends Node2D

const mainMenu = preload("res://scenes/main_menu.tscn")
const WorldMap = preload("res://scenes/WorldMap.tscn")
var tempInstance
 
func _ready() -> void:
	spawnNode(WorldMap)
	spawnNode(mainMenu)
	
	
	#var a : int = 6
	#print(6%a)
	#print(4%a)
	#print(1%a)
	#print(0%a)
	#print(-10%a)
 
func _process(_delta: float) -> void:
	pass




func spawnNode(resource) -> void:
	tempInstance = resource.instantiate() # instance_from_id()
	self.add_child(tempInstance,false,InternalMode.INTERNAL_MODE_BACK) # INTERNAL_MODE_BACK
	
 
