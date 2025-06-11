extends Node2D

const mainMenu = preload("res://scenes/main_menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var balls := mainMenu.instantiate() # instance_from_id()
	self.add_child(balls,false,2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
