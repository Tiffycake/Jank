extends Node2D
class_name Inventory
#@export var inv1 : inv
var selectedSlot : int = 0
const inv_size : int = 5
@export var _content_array : Array[InvItem]
#var temp_weapon  : InvItem = ( preload("res://resources/invItems/weapon.tres") as InvItem )

var n : int

var selectedItem : InvItem
var selectedNode : Item
# TODO: add slot locking

func swap(a1: int,a2: int):	swap1.rpc(a1,a2)
func selectItem(n1: int):	_selectItem1.rpc(n1)
func remove_item(n1: int):	remove_item1.rpc(n1)
func add_item(item:InvItem):	add_item1.rpc(item)
 
func _init() -> void:
	_content_array.resize(inv_size)
	#_content_array.fill(null)

 
func _ready() -> void:
	selectItem(0)

@rpc("any_peer", "call_local")
func _selectItem1(n1: int) -> void:
	#print(n1," input || mod ",posmod(n1,5))
	
	n = posmod(n1,5)
	
	if selectedNode != null:
		selectedNode.unequip()
		
	selectedSlot = n
	selectedItem = _content_array[n]
	
	if selectedItem != null:
		
		if get_node_or_null(str(n)) != null: 
			selectedNode = get_node(str(n))
			selectedNode.equip()
		else:
			# spawn item scene 
			selectedNode = selectedItem.scene.instantiate()
			selectedNode.name = str(n)
			if selectedNode is Weapon:
				selectedNode.weapon_stats = selectedItem.stats 
			add_child(selectedNode)
			selectedNode.equip()
	else:
		selectedNode = null
		print ( selectedItem )

@rpc("any_peer", "call_local")
func add_item1(item:InvItem): #item:InvItem
	for i in range(len(_content_array)):
		print(_content_array[i])
		if _content_array[i] == null:
			_content_array.set(i,item)
			selectItem(i) # selects newly added item

@rpc("any_peer", "call_local")
func remove_item1(n1:int):
	_content_array.set(n,null)
	# kills child named n
	get_node(str(n1)).queue_free()
	#selectItem(n)

@rpc("any_peer", "call_local")
func swap1(a1: int,a2: int) -> void:
	
	var node1 : Node
	var node2 : Node
	
	# this function is funky in a bad way
	# at least its finished
	var b1 = _content_array[a1] # Array
	_content_array[a1] = _content_array[a2]
	_content_array[a2] = b1
	
	node1 = get_node_or_null(str(a1))
	if node1 != null: # OK WHAT ARE YOU DOING
		node1.name = str(a2) + "temp"

	node2 = get_node_or_null(str(a2))
	if node2 != null: 
		node2.name = str(a1) 
	
	if node1 != null:
		node1.name = str(a2)
		# i love jank
		
	selectItem(a2)


func get_items() -> Array[InvItem]:
	return _content_array

func get_item(n1) -> InvItem:
	return _content_array[n1]

	
