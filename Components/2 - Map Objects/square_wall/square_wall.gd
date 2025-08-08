extends StaticBody2D
@onready var sprite_2d: Sprite2D = $Sprite2D

var starting_scale : float

func _ready() -> void:
	starting_scale = sprite_2d.scale.x
	sprite_2d.scale = Vector2(0.9,0.9) * starting_scale
	var tween = get_tree().create_tween()
	tween.tween_property(sprite_2d, "scale", Vector2(1.1, 1.1) * starting_scale, 0.05)
	tween.tween_property(sprite_2d, "scale", Vector2(1, 1) * starting_scale, 0.1)
