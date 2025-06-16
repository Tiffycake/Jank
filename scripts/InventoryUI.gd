extends Control
#@onready var inv : Inventory = preload("res://invItems/Inventory.tres")
@onready var slots : Array = $"Slots".get_children()
@onready var player : = $"../.." 
@onready var inventory : = $"../../Inventory"
#@onready var inventory : = $"../../Inventory"

@onready var healthComponent1: HealthComponent = $"../../HealthComponent"
@onready var healthNum = $"healthNum"
@onready var healthbar = $"healthBar"
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	updateHealth()

func updateHealth():
	healthbar.max_value = healthComponent1.maxHealth
	healthbar.value = healthComponent1.health
	healthNum.text = str(healthComponent1.health)+" / "+str(healthComponent1.maxHealth)



"""

func updateSlots() -> void:
	#inventory.slots
	
	for i in slots:
		i.textureUpdate()
		pass


"""
