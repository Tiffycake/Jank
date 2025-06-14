extends Node
class_name Item 

@export var texture : TextureRect
@export var id : int


func _ready() -> void:
	add_child(texture)

func _process(_delta: float) -> void:
	pass
