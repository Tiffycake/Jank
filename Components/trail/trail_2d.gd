extends Line2D


@export var MAX_LENGHT := 10

func _process(_delta: float) -> void:
	var pos = get_parent().global_position
	add_point(pos)
	
	if get_point_count() > MAX_LENGHT:
		remove_point(0)
