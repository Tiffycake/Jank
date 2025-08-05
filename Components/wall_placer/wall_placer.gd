extends Item

@export var wallPath : PackedScene

@onready var objectList: Node = $"../../../../objectList"
@onready var timer: Timer = $Timer
@onready var player: = $"../.."

#@onready var objectList: Node = $"../../../../objectList"
#@onready var playerSprite:  = $"../../../Sprite2D"


var atackSpeed : float = 1  # attacks per second
#var textureTemp : Texture2D = preload("res://textures/random textures/blueprintbase_512-893892667.png")

var wallId : int

func fire():
	if timer.time_left == 0:
		spawnWall.rpc(get_global_mouse_position())


@rpc("any_peer", "call_local")
func spawnWall(mousePos) -> void:
	var wall : = wallPath.instantiate()
	wall.position = mousePos # get_global_mouse_position()
	wall.name =  "wall" + str(wallId) + " " + str(player.name)
	wallId+=1
	wall.content = ["medium",123]
	objectList.add_child(wall)
	timer.start()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#texture = textureTemp 
	timer.wait_time = 1/atackSpeed
	timer.one_shot = true	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
