extends Node2D
var bullet_path = preload("res://scenes/bullet.tscn")  
@onready var player: CharacterBody2D = $".." 
@onready var timer: Timer = $Timer
@onready var bulletList: Node = Node.new()

var atackSpeed : float = 20  # attacks per second

func _ready() -> void:
	timer.wait_time = 1/atackSpeed
	timer.one_shot = true	
	bulletList.name = "bulletList"
	self.add_child(bulletList)
	pass # Replace with function body.


func fire():
	if timer.time_left == 0:
		var bullet = bullet_path.instantiate()
		bullet.pos = self.global_position
		bullet.dir = player.rotation
		bullet.rota = self.global_rotation
		timer.start()
		bulletList.add_child(bullet)


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
