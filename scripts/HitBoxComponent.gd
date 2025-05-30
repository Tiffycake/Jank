extends Area2D

@export var healthComponent : HealthComponent

func damage(attack: Attack):
	if healthComponent != null:
		healthComponent.damage(attack)




func _init() -> void:
	collision_layer = 2
	collision_mask = 0
