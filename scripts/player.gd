extends CharacterBody2D 

var speed: = 600
@onready var weapon: Node2D = $"Inventory/Weapon"
@onready var objectList: Node = $"../../objectList"
var camera : Camera2D = Camera2D.new()
@onready var coolBox : CollisionShape2D  = $"CollisionBox2D" # :sunglasses:

const wall = preload("res://scenes/basic_wall.tscn")
var growSpeed : int = 60
var counter1 : int = growSpeed
var counterdelta : int = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if is_multiplayer_authority():
		add_child(camera)
	self.tree_exited.connect(die)
	

func get_input():
	if DisplayServer.window_is_focused():
		look_at(get_global_mouse_position())
	var attack = Input.is_action_pressed("leftClick")
	var use = Input.is_action_pressed("rightClick")
	var inputDir = Input.get_vector("left","right","up","down")
	velocity = inputDir * speed

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

	
	coolBox.set_scale(Vector2(counter1/float(growSpeed),counter1/float(growSpeed)))
	
	counter1+=counterdelta
	
	if counter1 < 0 or  counter1 > 100:
		counterdelta *= -1

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())

func die() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
