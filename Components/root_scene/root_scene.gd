extends Node2D
# main root

@export var MainMenu  : PackedScene
@export var WorldMap  : PackedScene 
#const a12 : stat_sheet = preload("res://resources/invItems/stats/ar3.tres")

func _ready() -> void:
	spawnNode(WorldMap)
	spawnNode(MainMenu)
	
	
	
	
	# fps shennanigans
	
	#VSYNC_ADAPTIVE VSYNC_MAILBOX VSYNC_ENABLED VSYNC_DISABLED
	
	#Engine.max_fps = 165
	#var v := DisplayServer.VSyncMode.VSYNC_ADAPTIVE
	#DisplayServer.window_set_vsync_mode(v)
	
	#TYPE_BOOL
	#bool.TYPE_BOOL
	#for i in a12.get_property_list(): 
		#var a  : String = i["name"]
		#if i["usage"] >= 4102 and !( a in ["script","weaponSprite"]): # terrible checking
			#print(a, " : ", a12.get(i["name"]))
			
			#a12.set()
	# script and Texture2D apearing TODO: fix 
	

	
	#for i in get_node("/root").get_children():
		#print(i)
	#print(recursive_iter([[1,2],3,[4],[5,[6]]]))
	
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
	
 
