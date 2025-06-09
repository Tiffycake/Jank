extends Sprite2D


@onready var hand1: Sprite2D = get_child(0)
@onready var hand2: Sprite2D = get_child(1)




var gunEquipedState : = Vector2(-60.0,-150.0)
var unarmedState : = Vector2(-99.0,-128.0)

func gunEquiped1() -> void:
	#hand1.set_position(gunEquipedState)
	hand1.position = gunEquipedState
	hand2.position = gunEquipedState * Vector2(-1,1)
	#hand2.set_position(gunEquipedState * Vector2(-1,1)) 
	pass


func _ready() -> void:
	pass
 
func _process(delta: float) -> void:
	pass
# uneq	
# -99.0 -128.0
#  99.0 -128.0

# eq
#-60.0 -155.0
# + -




func skibidi(b) -> int:
	var o = b 
	return b
