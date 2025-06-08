extends Node2D
class_name Weapon

var bullet_path = preload("res://scenes/bullet.tscn")

@onready var objectList: Node = $"../../../../objectList"
@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = $"../.."
@onready var playerSprite:  = $"../../Sprite2D"


var bulletNumber : int = 0
#var bulletList := Node.new() 
	#bulletList.name = "bulletList"
	#self.add_child(bulletList)

var bulletLifetime		: int = 600
var bulletSpeed			: int = 1600 # projectile speed
var atackDamage			: int = 25 # weaponAtackDamage
var atackSpeed			: float = 4  # attacks per second

func _ready() -> void:
	timer.wait_time = 1/atackSpeed
	timer.one_shot = true	
	playerSprite.gunEquiped()
	
func fire():
	if timer.time_left == 0:
		spawn_bullet.rpc()


@rpc("any_peer", "call_local")
func spawn_bullet():
	var bullet = bullet_path.instantiate()
	var attackComponent : AttackComponent = bullet.get_child(0) # "AttackComponent"
	attackComponent.attackDamage = atackDamage
	bullet.pos = self.global_position
	bullet.dir = player.rotation
	bullet.rota = self.global_rotation
	bullet.speed = bulletSpeed
	bullet.lifetime = bulletLifetime
	timer.start()
	bullet.name = "bullet " + str(bulletNumber)
	bulletNumber+=1
	objectList.add_child(bullet)

func _process(_delta: float) -> void:
	pass
