extends Area2D
class_name HitboxComponent
#@export var healthComponent : HealthComponent 
@onready var healthComponent : HealthComponent = $"../HealthComponent"



func _ready() -> void:
	self.area_entered.connect(_on_body_entered)
	
func _init() -> void:
	#uhhh add sibling CollisionShape2D copy as child 
	
	#collision_layer = 2
	#collision_mask = 0
	pass
 


func _on_body_entered(attack: AttackComponent) -> void:
	#when an attack component collides with the hitbox comp
	#print("is this real", attack)
	healthComponent.damage(attack)
	attack.get_parent().queue_free()
	
	
	
	
	
	
	
#region New Code Region
func damage_fake(attack: AttackComponent):
	print(attack, " triggered")
	if healthComponent:
		print(attack, " triggered", healthComponent)
		healthComponent.damage(attack)
#endregion

	
	
	
