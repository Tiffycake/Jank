extends Node2D

@export var maxHealth := 20
var health : int 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = maxHealth


func damage(attack: Attack):
	health -= attack.attackDamage
	if health <= 0:
		get_parent().queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
