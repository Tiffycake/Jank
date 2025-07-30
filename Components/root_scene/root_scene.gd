extends Node2D
# main root

@export var mainMenu  : PackedScene 
@export var WorldMap  : PackedScene 

func _ready() -> void:
	spawnNode(WorldMap)
	spawnNode(mainMenu)

func _process(_delta: float) -> void:
	pass



func spawnNode(scene : PackedScene) -> void:
	var tempInstance = scene.instantiate() # instance_from_id()
	self.add_child(tempInstance,false,InternalMode.INTERNAL_MODE_BACK) # INTERNAL_MODE_BACK
	
 
