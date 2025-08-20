extends Control
@onready var inventory : Inventory = $"../../../../Inventory" # wow wtf is this
						#slots / controll / HUD / player
@onready var slotOutline: Sprite2D = $SlotOutline
@onready var slot: Sprite2D = $Slot
@onready var textureSprite: TextureRect = $"CenterContainer/Panel/slotTexture"

var slotContent : InvItem 
var slotId : int

func _ready() -> void:
	slotId = int(name) # const

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

func _get_drag_data(_at_position: Vector2) -> Variant:  # runs on press
#region preview thing
	slotContent = inventory._content_array[slotId]
	if slotContent != null:
		var preview 	   := Control.new() # this exists so you can offset the prev texture
		var previewTexture := TextureRect.new()
		preview.add_child(previewTexture)
		previewTexture.texture = slotContent.icon
		#textureSprite.texture = null # this is such a good idea 
		# it doesn't work bc updateTexture() updates every frame
		# TODO: fix this
		previewTexture.expand_mode = TextureRect.EXPAND_IGNORE_SIZE 
		previewTexture.size = Vector2(80,80)
		previewTexture.position -= Vector2(40,40)
		set_drag_preview(preview)
		textureSprite.hide()
		preview.tree_exiting.connect(textureSpriteShow)
#endregion
	return slotId

func textureSpriteShow():
	textureSprite.show()

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool: # runs when hovering
	return data is int


func _drop_data(_at_position: Vector2, data: Variant) -> void: # runs on release

	if data is int: # this beeing a int is a bad idea what are you doing tiffy
		
		inventory.swap(data,slotId)
		
		#if the other slot is null ??? uhh fcuking exxplode ????
		#SKIBIDI
