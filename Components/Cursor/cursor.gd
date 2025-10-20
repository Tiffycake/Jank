extends Control

var le := 28

func _ready() -> void:
	var a : PackedVector2Array = [Vector2.UP		* le, Vector2.DOWN	* le]
	var b : PackedVector2Array = [Vector2.LEFT	* le, Vector2.RIGHT	* le]
	for i in [a,b]:
		var l = Line2D.new()
		l.set_points(i)
		add_child(l)



func _process(_delta: float) -> void:
	position = get_global_mouse_position()
 
