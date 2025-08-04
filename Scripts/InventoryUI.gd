extends Control


# this script name is super cursed

@onready var slots : Array = $"Slots".get_children()
@onready var player : = $"../.." 
@onready var inventory : Inventory = $"../../Inventory"
@onready var healthComponent1: HealthComponent = $"../../HealthComponent"
@onready var healthNum = $"HealthBar/HealthNum"
@onready var healthbar = $"HealthBar/HealthBar"
@onready var healthbar_back: TextureProgressBar = $HealthBar/HealthBarBack
@onready var bullet_count: Label = $AmmoCount/BulletCount
@onready var bullet_max: Label = $AmmoCount/BulletCount2


@onready var ammoCount: = $AmmoCount

var tween_running : = false

func _ready() -> void:
	pass 
	

func _process(_delta: float) -> void:
	updateHealth()
	updateBullet()

func updateHealth():
	healthbar.max_value = healthComponent1.maxHealth
	healthbar.value = healthComponent1.health
	healthNum.text = str(healthComponent1.health)+" / "+str(healthComponent1.maxHealth)
	
	if healthbar.value != healthbar_back.value and not tween_running:
		tween_running = true # so true
		var skibidi = get_tree().create_tween()
		skibidi.finished.connect(reset_tween)
		skibidi.set_trans(Tween.TRANS_CIRC) # tramsgener reference... so kewl.,.,,
		skibidi.set_ease(Tween.EASE_OUT)
		skibidi.tween_property(healthbar_back, "value", healthbar.value, 0.4)


# go go my peak reseter
func reset_tween():
	tween_running = false
  
func updateBullet():
	if !(inventory.selectedNode is Weapon) or inventory.selectedNode == null:
		ammoCount.hide()
	else:
		ammoCount.show()
		bullet_count.text = str(inventory.selectedNode.bulletCurCount)
		bullet_max.text = "/" + str(inventory.selectedNode.bulletMaxCount)
