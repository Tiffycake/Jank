extends Button

var chest = preload("res://scenes/chest.tscn")
@onready var control: = $".." 
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	self.pressed.connect(spawnerTrigger)
	spawnChest()

func spawnerTrigger() -> void:
	spawnChest()


func spawnChest() -> void:
	var chest1 = chest.instantiate()
	chest1.position = control.position #+ Vector2(20,136)
	self.add_child(chest1)
