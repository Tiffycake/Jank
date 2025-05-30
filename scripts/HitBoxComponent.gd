extends Area2D
class_name HitboxComponent
@export var healthComponent : HealthComponent

func damage(attack: Attack):
	if healthComponent:
		healthComponent.damage(attack)




func _init() -> void:
	collision_layer = 2
	collision_mask = 0
