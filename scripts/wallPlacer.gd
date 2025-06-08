extends Node2D

const wallPath = preload("res://scenes/basic_wall.tscn")

@onready var objectList: Node = $"../../../.."
@onready var timer: Timer = $Timer

var atackSpeed : float = 2  # attacks per second

func fire():
	if timer.time_left == 0:
		spawnWall.rpc(get_global_mouse_position())



@rpc("any_peer", "call_local")
func spawnWall(balls) -> void:
	var wall : StaticBody2D = wallPath.instantiate()
	objectList.add_child(wall)
	wall.position = balls# get_global_mouse_position()
	timer.start()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = 1/atackSpeed
	timer.one_shot = true	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
