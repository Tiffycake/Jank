extends Label
@onready var player : Player = $"../../.."
@onready var inventory : Inventory = $"../../../Inventory"

func _process(_delta: float) -> void:
	#text = str(a1.stats.s )
	var a1 = inventory.selectedItem
	if a1 and a1.get("stats"): # this might be jank
		text = Globals.bolasa(a1.stats)
		
	else:
		text = ""
