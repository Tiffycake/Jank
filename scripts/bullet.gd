extends CharacterBody2D
var pos:Vector2
var rota:float
var dir:float
#@onready var player : CharacterBody2D = $"../../.."


var speed        :int #= 1200
var attackDamage :int #= 1
var lifetime     :int #= 600


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position=pos
	global_rotation=rota


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	velocity = Vector2(speed,0).rotated(dir) #+ player.velocity
	move_and_slide()
	if lifetime <= 0:
		self.queue_free() 
	lifetime-=1
