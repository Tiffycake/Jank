extends CharacterBody2D 

var speed: = 600
@onready var weapon: Node2D = $"Inventory/Weapon"
@onready var objectList: Node = $"../../objectList"
var camera : Camera2D = Camera2D.new()
@onready var coolBox : CollisionShape2D  = $"CollisionBox2D" # :sunglasses:

const wall = preload("res://scenes/basic_wall.tscn")

const maxScale := 1.0
const minScale := 0.75
const scale_factor := 3.5

var inputDir : Vector2

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
	inputDir = Input.get_vector("left","right","up","down")
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
	
	if (is_on_wall()):
		var angle_to_wall = rad_to_deg(inputDir.angle_to(get_wall_normal()))
		if (angle_to_wall < 0): angle_to_wall = angle_to_wall * -1
		if(angle_to_wall > 130 and angle_to_wall < 230 and inputDir != Vector2(0,0)):
			if(coolBox.scale.x > minScale):
				coolBox.scale = Vector2(coolBox.scale.x - _delta * scale_factor, coolBox.scale.y - _delta * scale_factor)
		else:
			if(coolBox.scale.x < maxScale):
				coolBox.scale = Vector2(coolBox.scale.x + _delta * scale_factor, coolBox.scale.y + _delta * scale_factor)
	else:
		if(coolBox.scale.x < maxScale):
			coolBox.scale = Vector2(coolBox.scale.x + _delta * scale_factor, coolBox.scale.y + _delta * scale_factor)
	
	move_and_slide()


func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())

func die() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
