extends Control
@onready var inventory : = $"../../../../Inventory" # wow wtf is this
						#slots / controll / HUD / player

@onready var slot: Sprite2D = $Slot
@onready var slotOutline: Sprite2D = $SlotOutline

@onready var textureSprite: TextureRect = $"CenterContainer/Panel/slotTexture"

#var inventory : Inventory
#var slotList : Dictionary
#var slotNode : Node2D  
var slotId : int
var slotContent : invItem 
var slotParent : Node2D 

var marker : bool = true


func _ready() -> void:
	slotId = int(str(name)[-1]) # const
	get_slot()
	set_slot_texture() 


func _process(_delta: float) -> void:
	slotHighlight()


func get_slot():
	#if inventory.slots.size() > slotId+1:
	if inventory.get_children()[slotId].find_child("*",false):
		slotContent = inventory.get_children()[slotId].get_child(0)

func set_slot_texture():
	if slotContent != null:# and slotContent.texture != null:
		textureSprite.texture = slotContent.texture 


func slotHighlight() -> void:
	if inventory.selectedSlot == slotId:
		slot.hide()
		slotOutline.show()
	else:
		slot.show()
		slotOutline.hide()


func _drop_data(_at_position: Vector2, data: Variant) -> void: # runs on release
	
	if data is invItem:
		# funky swap reparenting 
		
		slotParent = data.get_parent() # slot node of the input slot
		get_slot() # slotContent = inventory.slots[slotId].get_child(0) # item on the current slot id
		 
		
		data.reparent(inventory.slots[slotId])
		#cursed_reparent.rpc(data,inventory.slots[slotId])
		if slotContent != null:
			slotContent.reparent(slotParent) 
			#cursed_reparent.rpc(slotContent,slotParent)
			textureSprite.texture = data.texture
			#spawn texture on this slot
		inventory.selectItem(int(str(slotParent.name)[-1]))

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool: # runs when hovering
	return data is invItem 



func _get_drag_data(_at_position: Vector2) -> Variant:  # runs on press
	var previewTexture := TextureRect.new() 
	var preview 	   := Control.new()
	
	
	preview.add_child(previewTexture)
	#get_slot()
	
	# explode texture on this slot
	# actually turn it into the other node
	textureSprite.texture = null
	
	get_slot()
	
	if slotContent != null:
		previewTexture.texture = slotContent.texture 
		previewTexture.expand_mode = TextureRect.EXPAND_IGNORE_SIZE 
		previewTexture.size = Vector2(80,80)
		previewTexture.position -= Vector2(40,40)
		
	set_drag_preview(preview)  
	 
	return slotContent
	
