extends Node
class_name ammo_inventory
#small medium heavy shell
#S M H L

signal count_changed

@export var ammo_counts : Dictionary = {"shell":200,"small":200,"medium":200,"heavy":200}
var ammo_counts_old : Dictionary

func _process(_delta: float) -> void:
	ammo_check()

func ammo_check():
	if ammo_counts != ammo_counts_old:
		
		emit_signal("count_changed") #; print("count_changed")
		ammo_counts_old = ammo_counts.duplicate()
