extends Control
class_name PewPewTimer

@onready var label: Label = $Label
@onready var texture_progress_bar: TextureProgressBar = $TextureProgressBar

var reloadTime : float

func _ready() -> void:
	hide()

func startPewPew(a : float):
	process_mode = Node.PROCESS_MODE_INHERIT
	show()
	reloadTime = a
	
	
	var pewpewtween = get_tree().create_tween() # Tween
	
	texture_progress_bar.value = texture_progress_bar.max_value
	
	pewpewtween.set_parallel(true)
	pewpewtween.tween_property(texture_progress_bar,"value",0,a)
	pewpewtween.tween_property(self, "reloadTime", 0, a)


func _process(_delta: float) -> void:
	if reloadTime != 0: #this makes it only update when needed
		label.text = str("%0.1f" % reloadTime) + "s"
