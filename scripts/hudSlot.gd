extends Control
@onready var player : = $"../../../.." # wow wtf is this

@onready var slot: Sprite2D = $Slot
@onready var slotOutline: Sprite2D = $SlotOutline
@onready var textureRect: TextureRect = $TextureRect


var slotList : Dictionary
var slotContent : Item 
var slotId : int

						#slots / controll / HUD / player
# when draging ?



func _get_drag_data(_at_position: Vector2) -> Variant:
	var previewTexture := TextureRect.new()
	var preview 	   := Control.new()
	
	previewTexture.texture  = slotContent.texture
	previewTexture.expand_mode = TextureRect.EXPAND_KEEP_SIZE 
	previewTexture.size = Vector2(80,80)
	previewTexture.position-= Vector2(40,40)
	
	preview.add_child(previewTexture)
	
	slotContent = slotList[slotId].get_child(0)  # 
	
	set_drag_preview(preview)
	slotList[slotId].get_child(0).queue_free() 
	
	return slotContent

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if data is Item:
		slotContent = data
	
func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data is Item

	


func _process(_delta: float) -> void:
	pass
	#if slotList[slotId].get_child(0) != null and slotList[slotId].get_child(0) != slotContent :
	#	slotContent = slotList[slotId].get_child(0) 
	
	slotHighlight()

func _ready() -> void:
	slotId = int(str(name)[-1])
	slotList = player.slotList
	slotContent = player.selectedItem
	
	#this is such jank what am i doing
	#var slotList = get_parent().get_parent().get_parent().get_parent().get_children()
	#for i in slotList:
		#if str(i.name) == "Slot"+ str(self.name)[-1] :
			#slot = i # .get_child(0)
			#break
	


func slotHighlight() -> void:
	if player.currentSlot == slotId:
		slot.hide()
		slotOutline.show()
	else:
		slot.show()
		slotOutline.hide()
