## item catcher
extends Panel


@onready var inventory : Inventory = $"../../../Inventory"
@onready var player : Player = $"../../.."
@onready var object_list :  = $"../../../.."
@export var pickup : PackedScene


func _ready() -> void:
	pass
	#print(" the inver ",inventory)

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool: # runs when hovering
	return data is int


func _drop_data(at_position: Vector2, data: Variant) -> void: # runs on release

	#explode item at slot n and spawn the item in world
	var a = inventory.get_item(data)
	
	inventory.remove_item(data)
	var b  : = pickup.instantiate()
	b.position = player.position
	b.content = a
	
	object_list.add_child(b)
	
	# spawn pickup with a data at _at_position
	
	#SKIBIDI
