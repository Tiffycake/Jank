extends Sprite2D


@onready var hand1: Sprite2D = $"hand1"
@onready var hand2: Sprite2D = $"hand2"
const skinPath : = "res://textures/Player Skins/"

#const handGeneric : = preload("res://textures/Player Skins/hands/hands generic.svg")
#const ballGeneric : = preload("res://textures/Player Skins/balls/balls generic.svg")

const gunEquipedState	: = Vector2(60.0,-150.0)
const unarmedState		: = Vector2(99.0,-128.0)
 
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


func setSkin(body: Color, hands: Color):
	if is_multiplayer_authority():
		changeBody(body)
		changeHands(hands)

func setSkin1(a1: Color):
	if is_multiplayer_authority():
		changeBody(a1)
		changeHands(a1)

func changeBody(a2: Color) -> void:
	self_modulate = a2

func changeHands(a2: Color) -> void:
	hand1.self_modulate = a2
	hand2.self_modulate = a2

#
#
#       uhhhh we have to do smth about these functions below lol idk if they're used
#
"""
func changeSkin(a2: Color) -> void:
	#if real:
		#set_texture(ballGeneric)
		#hand1.set_texture(handGeneric)
		#hand2.set_texture(handGeneric)
		#real = false
	
	modulate = a2


	
func _ready() -> void:
	pass
"""
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
