extends Sprite2D


@onready var hand1: Sprite2D = $hand1
@onready var hand2: Sprite2D = $hand2
var cord : = Vector2(-60.0,-155.0)

func gunEquiped() -> void:
	#hand1.set_position(cord)
	#hand2.set_position(cord * Vector2(-1,1)) 
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
