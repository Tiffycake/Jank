extends Node2D

const mainMenu = preload("res://scenes/main_menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var balls := mainMenu.instantiate() # instance_from_id()
	add_child(balls,false,InternalMode.INTERNAL_MODE_BACK) # INTERNAL_MODE_BACK
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
