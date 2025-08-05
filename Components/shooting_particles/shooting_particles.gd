extends GPUParticles2D

func _ready() -> void:
	emitting = true

# smort code :3
func _on_finished() -> void:
	queue_free()
