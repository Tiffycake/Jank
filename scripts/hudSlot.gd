extends Control
@onready var inventory : = $"../../../../Inventory" # wow wtf is this

@onready var slot: Sprite2D = $Slot
@onready var slotOutline: Sprite2D = $SlotOutline

@onready var texture1: Sprite2D = $"CenterContainer/Panel/Sprite2D"

var slotId : int
#var inventory : Inventory
#var slotList : Dictionary
#var slotContent : invItem 
var slotNode : Node2D
var slotParent : Node2D



						#slots / controll / HUD / player
# when draging ?
func _ready() -> void:
	slotId = int(str(name)[-1]) # const
	#inventory = player.inventory
	#print("slots gambla",player.slotList)
	#slotNode = slotList[slotId]
func _process(_delta: float) -> void:
	slotHighlight()


func slotHighlight() -> void:
	
	if inventory.selectedSlot == slotId:
		slot.hide()
		slotOutline.show()
	else:
		slot.show()
		slotOutline.hide()


func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if data is invItem:
		slotParent = data.get_parent()
		var a = inventory.slots[slotId].get_child(0)
		data.unEquiped()
		data.reparent(inventory.slots[slotId])
		a.reparent(slotParent)
		a.equiped()
		# reparent date on inventory.slots[slotId] to data parent
	pass

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	
	
	if data is invItem:
		print("can i drop this")
	return data is invItem

func _get_drag_data(_at_position: Vector2) -> Variant: 
	var previewTexture := TextureRect.new() 
	var preview 	   := Control.new()
	preview.add_child(previewTexture)
	
	slotNode = inventory.slots[slotId].get_child(0)
	if slotNode != null:
		previewTexture.texture = slotNode.texture 
		previewTexture.expand_mode = TextureRect.EXPAND_IGNORE_SIZE 
		previewTexture.size = Vector2(80,80)
		previewTexture.position -= Vector2(40,40)
		
	set_drag_preview(preview) 
	#var balls = 
	 
	return slotNode
	

"""
func _get_drag_data(_at_position: Vector2) -> Variant:
	#slotContent = slotNode.get_child(0)
	var previewTexture := TextureRect.new()
	#var preview 	   := Control.new()
	
	if inventory.selectedItem != null:
		previewTexture.texture  = inventory.slots[slotId].texture
		previewTexture.expand_mode = TextureRect.EXPAND_KEEP_SIZE 
		previewTexture.size = Vector2(80,80)
		previewTexture.position-= Vector2(40,40)
	
	#preview.add_child(previewTexture)
	set_drag_preview(previewTexture)
	
	# var balls : = slotNode.get_child(0).duplicate()
	var balls = inventory[str(slotId)]
	
	#slotNode.get_child(0).unEquiped()
	#slotNode.get_child(0).queue_free() 
	
	return balls

"""
"""
func _get_drag_data(_at_position: Vector2) -> Variant:
	#slotContent = slotNode.get_child(0)
	var previewTexture := TextureRect.new()
	#var preview 	   := Control.new()
	
	if inventory[str(slotId)] != null:
		previewTexture.texture  = inventory[str(slotId)].texture
		previewTexture.expand_mode = TextureRect.EXPAND_KEEP_SIZE 
		previewTexture.size = Vector2(80,80)
		previewTexture.position-= Vector2(40,40)
	
	#preview.add_child(previewTexture)
	set_drag_preview(previewTexture)
	
	# var balls : = slotNode.get_child(0).duplicate()
	var balls = inventory[str(slotId)]
	
	#slotNode.get_child(0).unEquiped()
	#slotNode.get_child(0).queue_free() 
	
	return balls



"""
		
"""


func textureUpdate(item: invItem):
	if item != null: 
		pass
		texture1.visible = true
		texture1.texture = item.texture
	else:
		texture1.visible = false
		
		
"""


	#if slotList[slotId].get_child(0) != null and slotList[slotId].get_child(0) != slotContent :
	#	slotContent = slotList[slotId].get_child(0) 
	

	#this is such jank what am i doing
	#var slotList = get_parent().get_parent().get_parent().get_parent().get_children()
	#for i in slotList:
		#if str(i.name) == "Slot"+ str(self.name)[-1] :
			#slot = i # .get_child(0)
			#break

	
	
	
#var done : bool = true
	# jank 
	#if player.is_node_ready() and done :
		#done = false
		#slotList = player.slotList
		#slotNode = slotList[slotId]
		#print("slots gambla",player.slotList) 
