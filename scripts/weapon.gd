extends Node2D
var bullet_path = preload("res://scenes/bullet.tscn")

@onready var player: CharacterBody2D = $"../.."
@onready var objectList: Node = $"../../../../objectList"
@onready var timer: Timer = $Timer 


#var bulletList := Node.new() 
	#bulletList.name = "bulletList"
	#self.add_child(bulletList)

var bulletLifetime		: int = 600
var bulletSpeed			: int = 1200 #projectile
var atackDamage			: int = 25 # weaponAtackDamage
var atackSpeed			: float = 4  # attacks per second

func _ready() -> void:
	
	timer.wait_time = 1/atackSpeed
	timer.one_shot = true	
	
func fire():
	if timer.time_left == 0:
		var bullet = bullet_path.instantiate()
		var attackComponent : AttackComponent = bullet.get_child(0) # "AttackComponent"
		attackComponent.attackDamage = atackDamage
		bullet.pos = self.global_position
		bullet.dir = player.rotation
		bullet.rota = self.global_rotation
		bullet.speed = bulletSpeed
		bullet.lifetime = bulletLifetime
		timer.start()
		objectList.add_child(bullet)


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
