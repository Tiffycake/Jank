extends Node2D
class_name Weapon

var bulletPath = preload("res://scenes/bullet.tscn")

@onready var objectList: Node = $"../../../../objectList"
@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = $"../.."
@onready var playerSprite:  = $"../../Sprite2D"


var bulletId : int = 0
#var bulletList := Node.new() 
	#bulletList.name = "bulletList"
	#self.add_child(bulletList)

var bulletLifetime		: int = 600
var bulletSpeed			: int = 2000 # projectile speed
var atackDamage			: int = 1 # weaponAtackDamage
var atackSpeed			: float = 90  # attacks per second

func _ready() -> void:
	timer.wait_time = 1/atackSpeed
	timer.one_shot = true
	#playerSprite.gunEquiped()
	
func fire():
	if timer.time_left == 0:
		spawn_bullet.rpc()

func equiped():
	playerSprite.gunEquiped()
	show()
	
func unEquiped():
	playerSprite.unarmed()
	hide()
@rpc("any_peer", "call_local")
func spawn_bullet():
	var bullet = bulletPath.instantiate()
	var attackComponent : AttackComponent = bullet.get_child(0) # "AttackComponent"
	attackComponent.attackDamage = atackDamage
	bullet.pos = self.global_position
	bullet.dir = player.rotation
	bullet.rota = self.global_rotation
	bullet.speed = bulletSpeed
	bullet.lifetime = bulletLifetime
	timer.start()
	bullet.name = "bullet " + str(bulletId)
	bulletId+=1
	objectList.add_child(bullet)

func _process(_delta: float) -> void:
	pass
