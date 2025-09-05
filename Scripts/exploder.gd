extends Node2D
# HUD
#@onready var inventory : = $" ../../Inventory" # wow wtf is this
						# HUD / player
#@onready var slots: Array = $"Control/Slots".get_children()

func _ready() -> void:
	
	queue_free() # $"Unused".
	
 
