extends Node2D
class_name HealthComponent

@export var maxHealth : int
var health : int 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = maxHealth


func damage(attack: AttackComponent):
	health -= attack.attackDamage
	if health <= 0:
		get_parent().queue_free()


 
