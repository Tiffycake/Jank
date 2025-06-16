extends Area2D
class_name HitboxComponent
#@export var healthComponent : HealthComponent 
@onready var healthComponent : HealthComponent 



func _ready() -> void:
	self.area_entered.connect(onAreaEntered)
	self.body_entered.connect(onBodyEntered)
	
	healthComponent = $"../HealthComponent"

func _init() -> void:
	#uhhh add sibling CollisionShape2D copy as child (or not)
	#collision_layer = 2
	#collision_mask = 0
	pass
 


func onBodyEntered(body):
	if body is Player and $".." is Player:
		pass
		#print("pretend its being pushed :3")

func onAreaEntered(attack) -> void:

	if attack is AttackComponent:
		attack.get_parent().queue_free()
		if healthComponent:
			healthComponent.damage(attack)
	#when an attack component collides with the hitbox comp
	#print("is this real", attack)
	
	
	
	 
	
	
