extends TextureRect

# when draging ?
func _get_drag_data(_atPosition: Vector2) -> Variant:
	var prevTexture = TextureRect.new()
	#self.
	prevTexture.texture = texture
	prevTexture.expand_mode = 1
	prevTexture.size = Vector2(80,80)
	
	var preview = Control.new()

	preview.add_child(prevTexture)

	set_drag_preview(preview)
	prevTexture.position-=Vector2(40,40)
	texture = null
	
	return prevTexture.texture

# when hovering with a dropable Variant
func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	
	return data is Texture2D
	
# on drop
func _drop_data(_at_position: Vector2, data: Variant) -> void:
	texture = data
