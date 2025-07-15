extends Control



@onready var inventory : Inventory = $"../../../../Inventory" # wow wtf is this
						#slots / controll / HUD / player
@onready var slotOutline: Sprite2D = $SlotOutline
@onready var slot: Sprite2D = $Slot
@onready var textureSprite: TextureRect = $"CenterContainer/Panel/slotTexture"


var slotContent : InvItem 
var slotId : int

func _ready() -> void:
	slotId = int(str(name)[-1]) # const  
	# HACK FIXME SKIBIDI
	# NOTE: this will break once the number reaches double (2) digits
	# texture thing #if slotContent != null:
		# texture thing #set_slot_texture(slotContent.texture)

func _process(_delta: float) -> void:
	slotHighlight()
	updateTexture()

func updateTexture():
	slotContent = inventory._content_array[slotId]
	
	if slotContent != null:
		textureSprite.texture = slotContent.icon
	else:
		textureSprite.texture = null

func slotHighlight() -> void:
	if inventory.selectedSlot == slotId:
		slot.hide()
		slotOutline.show()
	else:
		slot.show()
		slotOutline.hide()
 
func _can_drop_data(_at_position: Vector2, data: Variant) -> bool: # runs when hovering
	return data is int

func _get_drag_data(_at_position: Vector2) -> Variant:  # runs on press
	slotContent = inventory._content_array[slotId]
	if slotContent != null:
#region preview thing
		var previewTexture := TextureRect.new()
		#var preview 	   := Control.new()
		#preview.add_child(previewTexture)
		previewTexture.texture = slotContent.icon
		#textureSprite.texture = null # this is such a good idea 
		# it doesn't work bc updateTexture() updates every frame
		previewTexture.expand_mode = TextureRect.EXPAND_IGNORE_SIZE 
		previewTexture.size = Vector2(80,80)
		previewTexture.position -= Vector2(40,40)
		set_drag_preview(previewTexture)  
#endregion
		return slotId
	else:
		return null

func _drop_data(_at_position: Vector2, data: Variant) -> void: # runs on release

	if data is int: # this beeing a int is a bad idea what are you doing tiffy
		
		
		inventory.swap(data,slotId)

		#if the other slot is null ??? uhh fcuking exxplode ????
		
		
