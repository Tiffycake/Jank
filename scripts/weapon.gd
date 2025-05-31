extends Node2D
var bullet_path = preload("res://scenes/bullet.tscn") 
@onready var sprite_2d: Sprite2D = $"Sprite2D"
@onready var player: CharacterBody2D = $".." 
@onready var timer: Timer = $"Timer"
@onready var bulletList: Node = Node.new()


func fire():
	if timer.time_left == 0:
		var bullet = bullet_path.instantiate()
		bullet.dir = player.rotation
		bullet.pos = self.global_position
		bullet.rota = self.global_rotation
		timer.start()
		bulletList.add_child(bullet)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.one_shot = true	
	bulletList.name = "bulletList"
	self.add_child(bulletList)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
