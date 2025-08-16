extends Item
class_name Weapon


#region a

@export var bulletPath : PackedScene
@export var SHOOTING_PARTICLES  : PackedScene

@onready var objectList: Node = $"../../../../objectList"
@onready var player: CharacterBody2D = $"../.."
@onready var playerSprite:  = $"../../Sprite2D"
@onready var ammo_inv_node : ammo_inventory = $"../../AmmoInventory"
@onready var weaponSprite:  = $"Sprite2D"
@onready var timer:  Timer = $Timer
@onready var reload_timer  :  Timer = $ReloadTimer
@onready var pewPewTimer : PewPewTimer = $"../../HUD/Control/PewPewTimer"

@onready var sound : AudioStreamPlayer2D = $sound
@onready var sound_peak: AudioStreamPlayer2D = $sound_peak
var particle_list : = Node2D.new()
@onready var shoot_sprite: AnimatedSprite2D = $ShootSprite


var on : bool = true

var weapon_stats : stat_sheet


var bulletId : int
var bulletMaxCount		: int
var bulletCurCount		: int
 

#endregion


func _ready() -> void:
	bulletMaxCount	=	weapon_stats.bulletMaxCount
	bulletCurCount	=	weapon_stats.bulletMaxCount
	
	weaponSprite.texture  = weapon_stats.weaponSprite
	weaponSprite.position = weapon_stats.offset
	
	timer.wait_time = 1/weapon_stats.atackSpeed
	timer.one_shot = true
	
	reload_timer.wait_time = weapon_stats.reloadTime # this keeps erroring
	reload_timer.one_shot = true
	reload_timer.timeout.connect(refill_ammo)
	shoot_sprite.animation_finished.connect(hide_shoot_sprite)

	add_child(particle_list)

func fire() -> void:
	var a : bool = bulletCurCount > 0 and ammo_inv_node.ammo_counts[weapon_stats.bulletType] > 0
	if a  and timer.time_left == 0  and on:
		spawn_bullet.rpc()
		bulletCurCount -= 1
		ammo_inv_node.ammo_counts[weapon_stats.bulletType] -= 1
		
		var pew := SHOOTING_PARTICLES.instantiate() ; particle_list.add_child(pew)

func reload() -> void:
	if reload_timer.time_left == 0:
		on = false # disables firing
		reload_timer.start()
		pewPewTimer.startPewPew(reload_timer.wait_time)

func refill_ammo() -> void:
	
	var oopygoopy = ammo_inv_node.ammo_counts[weapon_stats.bulletType]
	if oopygoopy >= weapon_stats.bulletMaxCount:
		bulletCurCount = weapon_stats.bulletMaxCount
	else: bulletCurCount = oopygoopy
	pewPewTimer.hide()
	on = true # reenables firing

func equip() -> void:
	super()
	playerSprite.gunEquiped()

func unequip() -> void:
	super()
	playerSprite.unarmed()

@rpc("any_peer", "call_local")
func spawn_bullet(): # oh my miku i know this is old but
	
	#sound.play() :NecoALittleTrolling:
	sound_peak.play()
	
	shoot_sprite.show()
	shoot_sprite.play()
	
	var bullet = bulletPath.instantiate()
	
	#var attackComponent : AttackComponent = bullet.get_child(0) # "AttackComponent"
	var attackComponent : AttackComponent = bullet.get_node("AttackComponent")
	attackComponent.attackDamage = weapon_stats.atackDamage
	
	bullet.pos = self.global_position
	bullet.dir = player.rotation + deg_to_rad(weapon_stats.bulletSpread *(randf()*2 -1))
	bullet.rota = self.global_rotation
	bullet.speed = weapon_stats.bulletSpeed
	bullet.lifetime = weapon_stats.bulletLifetime
	timer.start()
	bullet.name = "bullet " + str(bulletId)+ " " + str(player.name)
	bulletId+=1
	objectList.add_child(bullet)

func hide_shoot_sprite():
	shoot_sprite.hide()
 





#region New Code Region
#bulletLifetime		=	weapon_stats.bulletLifetime
#bulletSpeed			=	weapon_stats.bulletSpeed
#atackDamage			=	weapon_stats.atackDamage
#atackSpeed			=	weapon_stats.atackSpeed
#bulletMaxCount		=	weapon_stats.bulletMaxCount
#bulletCurCount		=	weapon_stats.bulletMaxCount
#bulletType			=	weapon_stats.bulletType
#var bulletLifetime		: float  # = 60
#var bulletMaxCount		: int  # = 12
#var bulletSpeed			: int  # = 2000 # projectile speed
#var bulletSpread		: float
#var atackDamage			: int  # = 10 # weaponAtackDamage
#var atackSpeed			: float# = 5  # attacks per second
#var reloadTime			: float  # reload seconds
#var offset				: Vector2
#var bulletType : String
#endregion
