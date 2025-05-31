extends Area2D
class_name HitboxComponent
@export var healthComponent : HealthComponent 
#@onready var healthComponent : HealthComponent = $"../HealthComponent"

func damage(attack: AttackComponent):
	if healthComponent:
		healthComponent.damage(attack)
 	

func _init() -> void:
	# uhhh add sibling CollisionShape2D copy as child 
	pass
	
	#collision_layer = 2
	#collision_mask = 0

 


func _on_body_entered(attack: AttackComponent) -> void:
	print("is this real", attack)
	healthComponent.damage(attack)
	
	
	
	
	
	
	
	
	
	
	
