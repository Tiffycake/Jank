extends Node2D

var slots : Array[Node] 
 #Array Array(base: Array, type: int, class_name: StringName, script: Variant)

const invSize : int = 5 
var selectedSlot : int = 0
#@onready var mainHand : Node2D = $"slot"
var selectedItem: Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass #slots = get_children() + Array()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	slots = get_children()
	
	
	#this unequips everything and then equips slot 0
	for i in slots:
		if i.find_child("*",false):
			i.get_child(0).unEquiped()
	
	selectItem(0) 




func selectItem(n: int) -> void:
	selectItem1.rpc(n)

@rpc("any_peer", "call_local")
func selectItem1(n: int) -> void:
	# inventory.items.size() > n:# if slot is in range
	# this is harcoded to 5 but it doesnt matter lol
	
	if n >= 0 and invSize > n:  
	#n = n%5
		selectedSlot = n
		
		if selectedItem != null:
			selectedItem.unEquiped()
		
		if slots[n].find_child("*",false):
			selectedItem = slots[n].get_child(0)
			selectedItem.equiped()
		else:
			selectedItem = null
		



 
