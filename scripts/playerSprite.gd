extends Sprite2D


@onready var hand1: Sprite2D = $"hand1"
@onready var hand2: Sprite2D = $"hand2"
const skinPath : = "res://textures/Player Skins/" 

const handGeneric : = preload("res://textures/Player Skins/hands/hands generic.svg")
const ballGeneric : = preload("res://textures/Player Skins/balls/balls generic.svg")

var gunEquipedState	: = Vector2(60.0,-150.0)
var unarmedState	: = Vector2(99.0,-128.0)

var real : bool = true

#func _skinLoad() -> Array:
	#var a : Resource
	#var b : Array
	#for i in range(4):
		#a = load(skinPath+"balls "+str(i+1)+".svg")
		#b.append(a)
	#return b

func gunEquiped() -> void: 
	hand1.position = gunEquipedState * Vector2(-1,1)
	hand2.position = gunEquipedState 

func unarmed() -> void:
	hand1.position = unarmedState * Vector2(-1,1)
	hand2.position = unarmedState
	

func setColor(a2) -> void:
	modulate = a2


func setSkin(a1):
	if is_multiplayer_authority():
		changeSkin.rpc(a1)

@rpc("any_peer", "call_local")
func changeSkin(a2: Color) -> void:
	if real:
		set_texture(ballGeneric)
		hand1.set_texture(handGeneric)
		hand2.set_texture(handGeneric)
		real = false
	
	modulate = a2

func _ready() -> void:
	pass
	
# uneq	
# -99.0 -128.0
#  99.0 -128.0

# eq
#-60.0 -155.0
# + -
#
#func setc(a1):
	#if is_multiplayer_authority():
		#changec.rpc(a1)
#
#@rpc("any_peer", "call_local")
#func changec(_a2: int) -> void:
#
	#set_texture(ballGeneric)
