@tool
extends Node2D
class_name ammo_inventory
#small medium heavy shell
#S M H L

signal count_changed

@export var ammo_counts : Dictionary = {"shell":200,"light":200,"medium":200,"heavy":200}
@export var ammo_counts_old : Dictionary

func _process(delta: float) -> void:
	ammo_check()


func ammo_check():
	if ammo_counts != ammo_counts_old:
		count_changed.emit()
		emit_signal("count_changed")
		ammo_counts_old = ammo_counts
