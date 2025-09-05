extends Label
@onready var player : Player = $"../../.."
@onready var inventory : Inventory = $"../../../Inventory"

func _process(_delta: float) -> void:
	#text = str(inventory.selectedItem.stats.s )
	
	if inventory.selectedItem and inventory.selectedItem.get("stats"):
		
		text = Globals.bolasa(inventory.selectedItem.stats)
		
	else:
		text = ""
