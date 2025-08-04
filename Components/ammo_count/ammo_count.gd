extends Control

##Hud element
@export var ammo_count_scene : PackedScene 


@onready var ammo_inv : ammo_inventory = $"../../../AmmoInventory"

var keys := ["small","medium","heavy","shell"]
var nodes_arr : Dictionary[String,Node] 

func _ready() -> void:
	var icon_dic = Globals.loader("res://resources/textures/zombs/Bullets/" ,keys, "png")


	for i in keys:
		var skibi = ammo_count_scene.instantiate()
		add_child(skibi)
		
		skibi.get_child(1).texture = icon_dic[i]
		skibi.name = i
		nodes_arr.set(i,skibi) # nice magic letters dipshit
		
 

	ammo_inv.count_changed.connect(update_ammo)


func update_ammo() -> void:
	var ammo_counts : Dictionary = ammo_inv.ammo_counts
	
	for i in keys :
		var a : Label = nodes_arr[i].get_node("Label")
		a.text = str(ammo_counts[i])
