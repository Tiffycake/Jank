extends Line2D


@export var MAX_LENGHT := 10

var timer := 0.0

func _process(_delta: float) -> void:
	timer -= _delta
	if timer <= 0.0:
		timer = 1.0/60.0
		var pos = get_parent().global_position
		add_point(pos)
		
		if get_point_count() > MAX_LENGHT:
			remove_point(0)
