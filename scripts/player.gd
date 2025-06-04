extends CharacterBody2D 

var speed: = 600
@onready var weapon: Node2D = $"Inventory/Weapon"
@onready var objectList: Node = $"../../objectList"
var camera : Camera2D = Camera2D.new()


var wall = preload("res://scenes/basic_wall.tscn")


func get_input():
	if DisplayServer.window_is_focused():
		look_at(get_global_mouse_position())
	var attack = Input.is_action_pressed("leftClick")
	var use = Input.is_action_pressed("rightClick")
	var input_dir = Input.get_vector("left","right","up","down")
	velocity = input_dir * speed

	if use == true:
		spawnWall()

	if attack == true:
		weapon.fire()
	 

func spawnWall() -> void:
	var wall1 : StaticBody2D = wall.instantiate()
	objectList.add_child(wall1)
	wall1.global_position = get_global_mouse_position()

func _physics_process(_delta: float) -> void:
	if is_multiplayer_authority():
		get_input()
	move_and_slide()

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if is_multiplayer_authority():
		add_child(camera)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
