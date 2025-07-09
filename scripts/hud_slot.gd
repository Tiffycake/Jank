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
		#print(slotContent)
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
 
