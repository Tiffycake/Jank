extends Node2D

const mainMenu = preload("res://scenes/main_menu.tscn")
const WorldMap = preload("res://scenes/WorldMap.tscn")
var tempInstance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnNode(WorldMap)
	spawnNode(mainMenu)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass




func spawnNode(resource) -> void:
	tempInstance = resource.instantiate() # instance_from_id()
	self.add_child(tempInstance,false,InternalMode.INTERNAL_MODE_BACK) # INTERNAL_MODE_BACK
	
 
