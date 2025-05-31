extends Area2D
class_name HitboxComponent
@export var healthComponent : HealthComponent 
#@onready var healthComponent : HealthComponent = $"../HealthComponent"



func _ready() -> void:
	#var hitbox2 = get_node(".")
	self.area_entered.connect(_on_body_entered)
	
func _init() -> void:
	#uhhh add sibling CollisionShape2D copy as child 
	
	#collision_layer = 2
	#collision_mask = 0
	pass
 


func _on_body_entered(attack: AttackComponent) -> void:
	print("is this real", attack)
	healthComponent.damage(attack)
	
	
	
	
	
	
	
#region New Code Region
func _damage_does_nothing(attack: AttackComponent):
	print(attack, " triggered")
	if healthComponent:
		print(attack, " triggered", healthComponent)
		healthComponent.damage(attack)
#endregion

	
	
	
