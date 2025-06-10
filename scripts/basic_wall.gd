extends StaticBody2D
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	sprite_2d.scale = Vector2(0.9, 0.9)
	var tween = get_tree().create_tween()
	tween.tween_property(sprite_2d, "scale", Vector2(1.1, 1.1), 0.05)
	tween.tween_property(sprite_2d, "scale", Vector2(1, 1), 0.1)
