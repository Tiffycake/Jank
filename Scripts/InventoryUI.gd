extends Control


# this script name is super cursed

@onready var slots : Array = $"Slots".get_children()
@onready var player : = $"../.." 
@onready var inventory : Inventory = $"../../Inventory"
@onready var healthComponent1: HealthComponent = $"../../HealthComponent"
@onready var healthNum = $"HealthBar/HealthNum"
@onready var healthbar = $"HealthBar/HealthBar"
@onready var bullet_count: Label = $AmmoCount/BulletCount
@onready var bullet_max: Label = $AmmoCount/BulletCount2

@onready var ammoCount: = $AmmoCount
func _ready() -> void:
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	updateHealth()
	updateBullet()

func updateHealth():
	healthbar.max_value = healthComponent1.maxHealth
	healthbar.value = healthComponent1.health
	healthNum.text = str(healthComponent1.health)+" / "+str(healthComponent1.maxHealth)
  
func updateBullet():
	if !(inventory.selectedNode is Weapon) or inventory.selectedNode == null:
		ammoCount.hide()
	else:
		ammoCount.show()
		bullet_count.text = str(inventory.selectedNode.bulletCurCount)
		bullet_max.text = "/" + str(inventory.selectedNode.bulletMaxCount)
