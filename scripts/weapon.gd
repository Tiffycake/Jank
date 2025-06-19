extends invItem
#class_name Weapon

var bulletPath = preload("res://scenes/bullet.tscn")
var textureTemp = preload("res://textures/gun.svg")

@onready var objectList: Node = $"../../../../../objectList"
@onready var player: CharacterBody2D = $"../../.."
@onready var playerSprite:  = $"../../../Sprite2D"
@onready var timer: Timer = $Timer

@onready var sound : AudioStreamPlayer2D = $sound

var bulletId : int


var bulletLifetime		: int = 60
var bulletSpeed			: int = 2000 # projectile speed
var atackDamage			: int = 10 # weaponAtackDamage
var atackSpeed			: float = 5  # attacks per second

func _ready() -> void:
	#texture = textureTemp
	timer.wait_time = 1/atackSpeed
	timer.one_shot = true
	
	#playerSprite.gunEquiped()
	
func fire():
	if timer.time_left == 0   :
		spawn_bullet.rpc()

func equiped():
	super()
	playerSprite.gunEquiped()
	
func unEquiped():
	super()
	playerSprite.unarmed()
	
	
@rpc("any_peer", "call_local")
func spawn_bullet():
	sound.play()
	var bullet = bulletPath.instantiate()
	var attackComponent : AttackComponent = bullet.get_child(0) # "AttackComponent"
	attackComponent.attackDamage = atackDamage
	bullet.pos = self.global_position
	bullet.dir = player.rotation
	bullet.rota = self.global_rotation
	bullet.speed = bulletSpeed
	bullet.lifetime = bulletLifetime
	timer.start()
	bullet.name = "bullet " + str(bulletId)+ " " + str(player.name)
	bulletId+=1
	objectList.add_child(bullet)

func _process(_delta: float) -> void:
	pass
