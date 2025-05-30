extends CharacterBody2D 

@export var speed = 600
var bullet_path = preload("res://scenes/bullet.tscn")
@onready var eyes: Node2D = $Eyes
@onready var bulletList: Node = Node.new()


func fire():
	var bullet=bullet_path.instantiate()
	bullet.dir = rotation
	bullet.pos = eyes.global_position
	bullet.rota = global_rotation

	bulletList.add_child(bullet)

func get_input():
	look_at(get_global_mouse_position())
	var attack = Input.is_action_pressed("click")
	var input_dir = Input.get_vector("left","right","up","down")
	velocity = input_dir * speed
	if attack == true:
		fire()
	 

func _physics_process(delta: float) -> void: 
	get_input()
	move_and_slide()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bulletList.name = "bulletList"
	self.add_child(bulletList)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
