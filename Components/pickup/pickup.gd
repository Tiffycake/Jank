extends Area2D
class_name Pickup

var content : Array

@onready var icon := $"icon"

func _ready() -> void:
	
	icon.texture = Globals.resource_dict["bullets"][content[0]]


func collect(player : Player):
	
	var ammo : Dictionary = player.get_node("AmmoInventory").ammo_counts
	
	for i in ammo:
		if content[0] == i:
			ammo[i] += content[1] 
			
	queue_free()
