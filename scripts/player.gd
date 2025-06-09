extends CharacterBody2D 

var speed: = 600
@onready var weapon: Node2D = $"Inventory/Weapon"
@onready var wallPlacer: Node2D = $"Inventory/wallPlacer"
@onready var sprite: Sprite2D = $"Sprite2D"

@onready var objectList: Node = $"../../objectList"
var camera : Camera2D = Camera2D.new()
@onready var coolBox : CollisionShape2D  = $"CollisionBox2D" # :sunglasses:


const maxScale := 1.0
const minScale := 0.75
const scale_factor := 3.5

var inputDir : Vector2

func _ready() -> void:
	if is_multiplayer_authority():
		add_child(camera)
	self.tree_exited.connect(_die)
	
	sprite.gunEquiped() 

func get_input():
	if DisplayServer.window_is_focused():
		look_at(get_global_mouse_position())
	var attack = Input.is_action_pressed("leftClick")
	var use = Input.is_action_pressed("rightClick")
	inputDir = Input.get_vector("left","right","up","down")
	velocity = inputDir * speed

	if use == true:
		wallPlacer.fire()

	if attack == true:
		weapon.fire()
	 

func _physics_process(delta: float) -> void:
	if is_multiplayer_authority():
		get_input()
	squish(delta) 
	move_and_slide()

func squish(delta) -> void:
	if (is_on_wall()):
		var angle_to_wall = rad_to_deg(inputDir.angle_to(get_wall_normal()))
		if (angle_to_wall < 0): angle_to_wall = angle_to_wall * -1
		if(angle_to_wall > 130 and angle_to_wall < 230 and inputDir != Vector2(0,0)):
			if(coolBox.scale.x > minScale):
				coolBox.scale = Vector2(coolBox.scale.x - delta * scale_factor, coolBox.scale.y - delta * scale_factor)
		else:
			if(coolBox.scale.x < maxScale):
				coolBox.scale = Vector2(coolBox.scale.x + delta * scale_factor, coolBox.scale.y + delta * scale_factor)
	else:
		if(coolBox.scale.x < maxScale):
			coolBox.scale = Vector2(coolBox.scale.x + delta * scale_factor, coolBox.scale.y + delta * scale_factor)
	
	


func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())


func _die() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
