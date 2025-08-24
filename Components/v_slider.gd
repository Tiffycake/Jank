extends VSlider
@onready var camera : Camera2D = $"../../../Camera2D"
@onready var label : Label =  $"Label"

func _process(_delta: float) -> void:
	var a  =  self.value * -0.006 + 1
	if a != 0 and camera != null:
		camera.zoom = Vector2(a,a)
		
	label.text = str(value) + "\n" + str(a)
