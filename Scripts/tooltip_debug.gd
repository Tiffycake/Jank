extends Label
@onready var player : Player = $"../../.."
@onready var inventory : Inventory = $"../../../Inventory"

func _process(delta: float) -> void:
	#text = str(inventory.selectedItem.stats.s )
	text = Globals.bolasa(inventory.selectedItem.stats)
