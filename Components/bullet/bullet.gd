extends CharacterBody2D # change this to RigidBody2D one day

@onready var atkComp : AttackComponent = $"AttackComponent"
var pos  : Vector2
var rota : float
var dir  : float
#@onready var player : CharacterBody2D = $"../../.."


var speed        : int #= 1200
var attackDamage : int  # = atkComp.attackDamage #= 1
var lifetime     : float #= 600


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	attackDamage = atkComp.attackDamage
	global_position = pos
	global_rotation = rota
	#print(str(atkComp.get_property_list()).replace("}","}\n") )



func _process(delta: float) -> void:
	velocity = Vector2(speed,0).rotated(dir) #+ player.velocity
	move_and_slide()
	if lifetime <= 0.0:
		self.queue_free()
	lifetime -= delta
