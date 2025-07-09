extends Resource
class_name inv


var slots : Array[InvItem]
var inv_size : int = 5

func _init() -> void:
	slots.resize(inv_size)
	slots.fill(null)



#@export_enum() enum {slot0,slot1,slot2,slot3,slot4}
#@export enum a {slot0,slot1,slot2,slot3,slot4}
#@export_enum(slot0,slot1,slot2,slot3,slot4) #enum {slot0,slot1,slot2,slot3,slot4}
#@warning_ignore("assert_always_false")
