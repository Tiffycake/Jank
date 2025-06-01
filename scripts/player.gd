extends CharacterBody2D 

@export var speed = 600
@onready var weapon: Node2D = $Weapon



func get_input():
	look_at(get_global_mouse_position())
	var attack = Input.is_action_pressed("click")
	var input_dir = Input.get_vector("left","right","up","down")
	velocity = input_dir * speed
	if attack == true:
		weapon.fire()
	 

func _physics_process(_delta: float) -> void:
	if is_multiplayer_authority():
		get_input()
	move_and_slide()

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
