extends Area2D
class_name HitboxComponent
#@export var healthComponent : HealthComponent 
@onready var healthComponent : HealthComponent = $"../HealthComponent"

func damage(attack: AttackComponent):
	healthComponent.damage(attack)


func _on_area_entered(area: HitboxComponent) -> void:
	if area is HitboxComponent:
		print(area, "entered")
		var hitbox : HitboxComponent = area
		var attack = AttackComponent.new()
		attack.attackDamage = attackDamage
		attack.attackPosition = global_position
		hitbox.damage(attack)



func _init() -> void:
	# uhhh add sibling CollisionShape2D copy as child 
	pass
	
	#collision_layer = 2
	#collision_mask = 0
