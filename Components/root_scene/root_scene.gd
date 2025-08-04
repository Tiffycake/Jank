extends Node2D
# main root

@export var mainMenu  : PackedScene 
@export var WorldMap  : PackedScene 

func _ready() -> void:
	spawnNode(WorldMap)
	spawnNode(mainMenu)

	#var a : = [1,2,3,4]
	#var b : = [2,3,4,5]
	#print(a+b)

	#var a : = -12
	#print( +a )


#func _process(_delta: float) -> void:
	#pass



func spawnNode(scene : PackedScene) -> void:
	var tempInstance = scene.instantiate() # instance_from_id()
	self.add_child(tempInstance,false,InternalMode.INTERNAL_MODE_BACK) # INTERNAL_MODE_BACK
	
 
