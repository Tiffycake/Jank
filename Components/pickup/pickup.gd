extends Area2D
class_name Pickup

var content 

@onready var icon := $"icon"

var type : String

func _ready() -> void:
	if content is InvItem:
		type = "InvItem"
		icon.texture = content.icon
	elif content is Array:
		type = "Array"
		icon.texture = Globals.resource_dict["bullets"][content[0]]
	
	
	
	#
	# holy jank

		
func collect(player : Player):
	match (icon) :
		"InvItem":
			player.inventory.add_item(content)
		"Array":
			var ammo : Dictionary = player.get_node("AmmoInventory").ammo_counts
			ammo[content[0]] += content[1]
	
	queue_free()
	# [ "bullet type" , ammo to add : int ]
	
	#var ammo : Dictionary = player.get_node("AmmoInventory").ammo_counts
	
	#ammo[content[0]] += content[1] 
	#for i in ammo:
		#if content[0] == i:
			#ammo[i] += content[1] 
			
