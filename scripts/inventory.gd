extends Node2D
class_name Inventory
#@export var inv1 : inv
var selectedSlot : int = 0
@export var _content_array : Array[InvItem]
const inv_size : int = 5
#var temp_weapon  : InvItem = ( preload("res://resources/invItems/weapon.tres") as InvItem )

var selectedItem : InvItem

var selectedNode : Item

func selectItem(n: int):		_selectItem1.rpc(n)
func remove_item(n: int):		remove_item1.rpc(n)
func add_item(item:InvItem):	add_item1.rpc(item)
 
func _init() -> void:
	pass
	_content_array.resize(inv_size)
	#_content_array.fill(null)

 
func _ready() -> void:
	selectItem(0)

@rpc("any_peer", "call_local")
func _selectItem1(n: int) -> void:
	# TODO fix this so it isn't broken
	if n >= 0 and inv_size > n:
		
		if selectedNode != null:
			selectedNode.unequip()
		
		selectedSlot = n
		selectedItem = _content_array[n]
		
		if selectedItem != null:
			if selectedItem.initialized:
				selectedNode = get_node(str(n))
				selectedNode.equip()
			else: 
				selectedNode = selectedItem.scene.instantiate()
				if selectedNode is Weapon:
					selectedNode.weapon_stats = selectedItem.stats
				selectedNode.name = str(n) # InvItem
				add_child(selectedNode)
				selectedNode.equip() 
				selectedItem.initialized = true


func add_item1(item:InvItem): #item:InvItem
	for i in range(len(_content_array)):
		print(_content_array[i])
		if _content_array[i] == null:
			_content_array.set(i,item)
			#break

func remove_item1(n:int):
	_content_array.set(n,null)
	# kills child named n
	get_node(str(n)).queue_free()
	#selectItem(n)
	
	
func swap(a1: int,a2: int) -> void:
	# fuck
	var b = _content_array[a1]
	_content_array[a1] = _content_array[a2]
	_content_array[a2] = b
	#selectItem() select a1


func get_items() -> Array[InvItem]:
	return _content_array


	
# TODO: add slot locking
