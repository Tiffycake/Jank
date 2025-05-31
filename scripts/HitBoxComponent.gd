extends Area2D
class_name HitboxComponent
#@export var healthComponent : HealthComponent 
@onready var healthComponent : HealthComponent = $"../HealthComponent"

func damage(attack: AttackComponent):
	healthComponent.damage(attack)
 

func _init() -> void:
	# uhhh add sibling CollisionShape2D copy as child 
	pass
	
	#collision_layer = 2
	#collision_mask = 0

 
