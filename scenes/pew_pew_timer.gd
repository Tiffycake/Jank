extends Control
class_name PewPewTimer

@onready var label: Label = $Label
@onready var texture_progress_bar: TextureProgressBar = $TextureProgressBar

func _ready() -> void:
	hide()

func startPewPew(a : float):
	show()
	var pewpewtween = get_tree().create_tween() # Tween
	label.text = str(a) + "s" 
	texture_progress_bar.value = 100
	pewpewtween.tween_property(texture_progress_bar,"value",0,a) # PewPewTimer.
