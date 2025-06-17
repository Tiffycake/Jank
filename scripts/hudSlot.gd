extends Control
@onready var inventory : = $"../../../../Inventory" # wow wtf is this

@onready var slot: Sprite2D = $Slot
@onready var slotOutline: Sprite2D = $SlotOutline

@onready var textureSprite: Sprite2D = $"CenterContainer/Panel/Sprite2D"

var slotId : int
#var inventory : Inventory
#var slotList : Dictionary
var slotContent : invItem 
#var slotNode : Node2D  
var slotParent : Node2D 



						#slots / controll / HUD / player
# when draging ?
func _ready() -> void:
	slotId = int(str(name)[-1]) # const
	#slotTUpdate() 
	
func _process(_delta: float) -> void:
	slotHighlight()
	#	slotTUpdate()

func get_slot():
	slotContent = inventory.slots[slotId].get_child(0)
	
#func get_slot_parent():
	#slotContent = inventory.slots[slotId]


func slotTUpdate() -> void:
	get_slot()
	if slotContent.texture != null:
		textureSprite.texture = slotContent.texture.texture
	
func slotTUpdate1() -> void:
	get_slot()
	if slotContent != null:
		if "texture" in slotContent.get_property_list():
			textureSprite.texture = slotContent.texture.texture



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
		 
		#cursed_reparent.rpc(data,inventory.slots[slotId])
		data.reparent(inventory.slots[slotId])
		
		if slotContent != null:
			#cursed_reparent.rpc(slotContent,slotParent)
			slotContent.reparent(slotParent) 
			
			#spawn texture on this slot
		inventory.selectItem(int(str(slotParent.name)[-1]))

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool: # runs when hovering
	return data is invItem 

func _get_drag_data(_at_position: Vector2) -> Variant:  # runs on press
	var previewTexture := TextureRect.new() 
	var preview 	   := Control.new()
	
	# explode texture on this slot
	
	preview.add_child(previewTexture)
	get_slot()
	
	slotContent = inventory.slots[slotId].get_child(0)
	
	if slotContent != null:
		previewTexture.texture = slotContent.texture 
		previewTexture.expand_mode = TextureRect.EXPAND_IGNORE_SIZE 
		previewTexture.size = Vector2(80,80)
		previewTexture.position -= Vector2(40,40)
		
	set_drag_preview(preview) 
	#var balls = 
	 
	return slotContent
	
