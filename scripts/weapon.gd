extends Item
class_name Weapon


var bulletPath = preload("res://scenes/bullet.tscn") 

@onready var objectList: Node = $"../../../../objectList"
@onready var player: CharacterBody2D = $"../.."
@onready var playerSprite:  = $"../../Sprite2D"
@onready var weaponSprite:  = $"Sprite2D"
@onready var timer:  Timer = $Timer
@onready var reload_timer  :  Timer = $ReloadTimer
@onready var pewPewTimer : PewPewTimer = $"../../HUD/Control/PewPewTimer"

@onready var sound : AudioStreamPlayer2D = $sound

var on : bool = true


#region New Code Region
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
	reload_timer.timeout.connect(refill_ammo)
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
	#playerSprite.gunEquiped()

func fire() -> void:
	if timer.time_left == 0 and bulletCurCount > 0 and on:
		spawn_bullet.rpc()
		bulletCurCount-=1

func reload() -> void:
	if reload_timer.time_left == 0:
		on = false # disables firing
		reload_timer.start()
		print(reload_timer.wait_time)
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
 
