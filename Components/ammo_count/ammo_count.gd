@tool
extends Control

##Hud element
@export var ammo_count_scene : PackedScene 


@onready var ammo_inv : ammo_inventory = $"../../../AmmoInventory"

var nodes_arr : Dictionary[String,Node] 

func _ready() -> void:
	var keys := ["small","medium","heavy","shell"]
	var balls1 = Globals.loader("res://resources/textures/zombs/Bullets/" ,keys, "png")

	var c : int = 0

	for i in keys:
		var skibi = ammo_count_scene.instantiate()
		add_child(skibi)
		
		skibi.get_child(1).texture = balls1[i]
		skibi.name = i
		nodes_arr.set(i,skibi) # nice magic letters dipshit
		
		c+=1
 

	ammo_inv.count_changed.connect(update_ammo)


func update_ammo() -> void:
	var ammo_counts : Dictionary = ammo_inv.ammo_counts
	
	for i in ammo_counts :
		pass



#"small medium heavy shell"
# SMHL
#var jio : Dictionary = { "S":null, "M":null, "H":null, "L":null}

#@export var S_text : Texture2D 
#@export var M_text : Texture2D 
#@export var H_text : Texture2D 
#@export var L_text : Texture2D



#var S : TextureRect = get_child(0).get_child(1)
#var M : TextureRect = get_child(1).get_child(1)
#var H : TextureRect = get_child(2).get_child(1)
#var L : TextureRect = get_child(3).get_child(1)

	#S.texture = S_text 
	#M.texture = M_text 
	#H.texture = H_text 
	#L.texture = L_text
