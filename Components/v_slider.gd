extends VSlider
@onready var camera : Camera2D = $"../../../Camera2D"


func _process(_delta: float) -> void:
	
	var a  =  abs( -self.value/10)
	if a != 0:
		camera.zoom = Vector2(a,a)
