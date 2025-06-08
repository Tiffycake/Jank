extends Button

var chest = preload("res://scenes/chest.tscn")
@onready var objectList : = $"../../objectList" 
@onready var control : = $".." 
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	self.pressed.connect(spawnerTrigger)
	spawnChest()

func spawnerTrigger() -> void:
	spawnChest()


@rpc("any_peer", "call_local")
func spawnChest() -> void:
	var chest1 = chest.instantiate()
	chest1.position = Vector2(20,136) + control.global_position 
	objectList.add_child(chest1)
