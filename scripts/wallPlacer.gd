extends Item

const wallPath = preload("res://scenes/basic_wall.tscn")

@onready var objectList: Node = $"../../../../objectList"
@onready var playerSprite:  = $"../../Sprite2D"
@onready var timer: Timer = $Timer

var atackSpeed : float = 1  # attacks per second

func fire():
	if timer.time_left == 0:
		spawnWall.rpc(get_global_mouse_position())


func equiped():
	playerSprite.unarmed()
	show()

func unEquiped():
	playerSprite.unarmed()
	hide()
	

@rpc("any_peer", "call_local")
func spawnWall(mousePos) -> void:
	var wall : StaticBody2D = wallPath.instantiate()
	wall.position = mousePos # get_global_mouse_position()
	objectList.add_child(wall)
	timer.start()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = 1/atackSpeed
	timer.one_shot = true	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
