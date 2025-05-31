extends Button

var chest = preload("res://scenes/chest.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	self.pressed.connect(spawnerTrigger)


func spawnerTrigger() -> void:
	var chest1 = chest.instantiate()
	chest1.position = position + Vector2(20,136)
	self.add_child(chest1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
