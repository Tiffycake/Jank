extends Node
class_name HealthComponent

@export var maxHealth : int  = 100
var health : int 
@export var unbreakable : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = maxHealth


func damage(attack: AttackComponent):
	if !unbreakable:
		health -= attack.attackDamage
	
	if health <= 0:
		if $"..".has_method("die"):
			$"..".die()
		else:
			get_parent().queue_free()
		#get_parent().queue_free()


 
