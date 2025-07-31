extends Line2D

var queue : Array
@export var MAX_LENGHT := 10

func _process(delta: float) -> void:
	var pos = get_parent().global_position
	queue.push_front(pos)
	
	if queue.size() > MAX_LENGHT:
		queue.pop_back()
		
	clear_points()
	
	for point in queue:
		add_point(point)
