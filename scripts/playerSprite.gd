extends Sprite2D


@onready var hand1: Sprite2D = $"hand1"
@onready var hand2: Sprite2D = $"hand2"
const skinPath : = "res://textures/Player Skins/" 
const skin1 : = preload("res://textures/balls.svg")
const skin2 : = preload("res://textures/Player Skins/balls 1.svg")

const handGeneric : = preload("res://textures/Player Skins/hands/hands generic.svg")
const ballGeneric : = preload("res://textures/Player Skins/balls/balls generic.svg")

var skinList : = Array()

var gunEquipedState	: = Vector2(-60.0,-150.0)
var unarmedState	: = Vector2(-99.0,-128.0)


func _skinLoad() -> void:
	var a : Resource
	for i in range(10):
		a = load(skinPath+"balls "+str(i)+".svg")

func gunEquiped() -> void:
	#hand1.set_position(gunEquipedState)
	hand1.position = gunEquipedState
	hand2.position = gunEquipedState * Vector2(-1,1)
	#hand2.set_position(gunEquipedState * Vector2(-1,1)) 

func unarmed() -> void:
	hand1.position = unarmedState
	hand2.position = unarmedState * Vector2(-1,1)
	

func setColor(a2) -> void:
	modulate 


func setSkin(a1):
	if is_multiplayer_authority():
		changeSkin.rpc(a1)

@rpc("any_peer", "call_local")
func changeSkin(a2: Color) -> void:
	set_texture(ballGeneric)
	hand1.set_texture(handGeneric)
	hand2.set_texture(handGeneric)
	modulate = a2

func _ready() -> void:
	skinList.append(skin1)
	skinList.append(skin2)
	
# uneq	
# -99.0 -128.0
#  99.0 -128.0

# eq
#-60.0 -155.0
# + -

func setc(a1):
	if is_multiplayer_authority():
		changec.rpc(a1)

@rpc("any_peer", "call_local")
func changec(a2: int) -> void:

	set_texture(ballGeneric)
