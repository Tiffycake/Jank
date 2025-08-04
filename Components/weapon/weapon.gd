extends Item
class_name Weapon


#region New Code Region
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

var on : bool = true


var weapon_stats : stat_sheet

var bulletId : int

var bulletCurCount		: int
var bulletMaxCount		: int
var bulletLifetime		: int
var bulletSpeed			: int
var atackDamage			: int
var atackSpeed			: float

#endregion

func _ready() -> void:
	bulletLifetime		=   weapon_stats.bulletLifetime
	bulletSpeed			=   weapon_stats.bulletSpeed
	atackDamage			=   weapon_stats.atackDamage
	atackSpeed			=   weapon_stats.atackSpeed
	bulletMaxCount		=   weapon_stats.bulletMaxCount
	bulletCurCount		=   weapon_stats.bulletMaxCount
	
	weaponSprite.texture  = weapon_stats.weaponSprite
	weaponSprite.position = weapon_stats.offset
	
	timer.wait_time = 1/atackSpeed
	reload_timer.wait_time = weapon_stats.reloadTime # this keeps erroring
	timer.one_shot = true
	reload_timer.one_shot = true

	reload_timer.timeout.connect(refill_ammo)


func fire() -> void:
	var a : bool = timer.time_left == 0 and bulletCurCount > 0 and on and ammo_inv_node.ammo_counts["medium"] > 0
	if a:
		spawn_bullet.rpc()
		bulletCurCount -= 1
		ammo_inv_node.ammo_counts["medium"] -= 1
		var pew := SHOOTING_PARTICLES.instantiate()
		add_child(pew)

func reload() -> void:
	if reload_timer.time_left == 0:
		on = false # disables firing
		reload_timer.start()
		pewPewTimer.startPewPew(reload_timer.wait_time)

func refill_ammo() -> void:
	bulletCurCount = bulletMaxCount
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
 
