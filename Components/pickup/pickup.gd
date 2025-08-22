extends Area2D
class_name Pickup

var content : InvItem

@onready var icon := $"icon"

func _ready() -> void:
	
	icon.texture = content.icon
	
	#icon.texture = Globals.resource_dict["bullets"][content[0]]
	# holy jank


	#if has_overlapping_areas():
		#get_overlapping_areas().get(0)
		#
		#if area is Pickup and player.pickup:
		#area.collect(player)
		
func collect(player : Player):
	#print( "hello ??")
	player.inventory.add_item(content)
	content = null
	queue_free()
	# [ "bullet type" , ammo to add : int ]
	
	#var ammo : Dictionary = player.get_node("AmmoInventory").ammo_counts
	
	#ammo[content[0]] += content[1] 
	#for i in ammo:
		#if content[0] == i:
			#ammo[i] += content[1] 
			
