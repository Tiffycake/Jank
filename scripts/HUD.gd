extends CanvasLayer
# HUD
#@onready var inventory : = $" ../../Inventory" # wow wtf is this
						# HUD / player
@onready var slots: Array = $"Control/Slots".get_children()

func _ready() -> void:
	$"Unused".queue_free()
	

#func _process(_delta: float) -> void:
	#for i in slots:
		#i.updateTexture()
