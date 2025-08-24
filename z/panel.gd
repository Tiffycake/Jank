## item catcher
extends Panel


@onready var inventory : Inventory = $"../../../Inventory"
@onready var player : Player = $"../../.."
@onready var object_list :  = $"../../../.."
@export var pickup : PackedScene

const MAX_DROP_DISTANCE = 150

func _ready() -> void:
	pass
	#print(" the inver ",inventory)

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool: # runs when hovering
	return data is int


func _drop_data(at_position: Vector2, data: Variant) -> void: # runs on release
	skibidi.rpc(data,at_position)


@rpc("any_peer","call_local")
func skibidi(data,at_position):
	#explode item at slot n and spawn the item in world
	var a = inventory.get_item(data)
	if a != null:
		
		inventory.remove_item(data)
		var b  : = pickup.instantiate()
		var pos = player.mouse_pos
		if player.position.distance_to(player.mouse_pos) > MAX_DROP_DISTANCE : pos = player.global_position + player.mouse_pos.normalized() * MAX_DROP_DISTANCE
		b.position = pos
		b.content = a
		object_list.add_child(b)
	
	# spawn pickup with a data at _at_position
	
	#SKIBIDI
