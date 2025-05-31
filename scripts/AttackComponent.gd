extends Node2D
class_name AttackComponent
# this is essentialy a hurbox lol
@export var attackDamage : int = 5

var attackPosition : Vector2 = Vector2(0,0)
var poison : int # poison dmg (posion is x dmg for 4 seconds)
var freeze : int # time frozen 
var burn : int   # burn time (burn is 3dmg/s)



func _on_hitbox_entered(area: Area2D) -> void:
	print(area,"attack")


func _ready() -> void:
	pass 
func _process(delta: float) -> void:
	pass
