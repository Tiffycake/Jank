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
@onready var sound_peak: AudioStreamPlayer2D = $sound_peak

var on : bool = true


var weapon_stats : stat_sheet

var bulletId : int

var bulletCurCount		: int
var bulletMaxCount		: int
var bulletLifetime		: float
var bulletSpeed			: int
var atackDamage			: int
var atackSpeed			: float

#endregion

var b : = Node2D.new()

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

	add_child(b)

func fire() -> void:
	var a : bool = bulletCurCount > 0 and ammo_inv_node.ammo_counts["medium"] > 0
	if a  and timer.time_left == 0  and on:
		spawn_bullet.rpc()
		bulletCurCount -= 1
		ammo_inv_node.ammo_counts["medium"] -= 1
		
		var pew := SHOOTING_PARTICLES.instantiate() ; b.add_child(pew)

func reload() -> void:
	if reload_timer.time_left == 0:
		on = false # disables firing
		reload_timer.start()
		pewPewTimer.startPewPew(reload_timer.wait_time)

func refill_ammo() -> void:
	var oopygoopy = ammo_inv_node.ammo_counts["medium"]
	if oopygoopy >= bulletMaxCount:
		bulletCurCount = bulletMaxCount
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
 
