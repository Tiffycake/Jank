extends Control
@onready var textureRect: TextureRect = $TextureRect
var slotList : Dictionary
var slot : Node2D
var slotId : int
@onready var slotOutline: Sprite2D = $SlotOutline

@onready var player : = $"../../../.."
 		#slots / controll / HUD / player
# when draging ?

func _process(delta: float) -> void:
	if player.currentSlot == slotId:
		slotOutline.show()
	else:
		slotOutline.hide()

func _ready() -> void:
	slotId = int(str(name)[-1])
	slotList = player.slotList
	pass
	#this is such jank what am i doing
	#var slotList = get_parent().get_parent().get_parent().get_parent().get_children()
	#for i in slotList:
		#if str(i.name) == "Slot"+ str(self.name)[-1] :
			#slot = i # .get_child(0)
			#break
	
func _get_drag_data(_atPosition: Vector2) -> Variant:
	
	var slotItem = Item.new()
	var preview = Control.new()
	
	#self.
	#slotItem.texture.texture = textureRect.texture
	slotItem.texture.expand_mode = 1
	slotItem.texture.size = Vector2(80,80)
	

	preview.add_child(slotItem)

	set_drag_preview(preview)
	slotItem.position-=Vector2(40,40)
	textureRect.texture = null
	
	return slotItem

# when hovering with a dropable Variant
func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data is Item
	
# on drop
func _drop_data(_at_position: Vector2, data: Variant) -> void:
	textureRect.texture = data.texture
