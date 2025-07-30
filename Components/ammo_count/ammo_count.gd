extends Control


func _ready() -> void:
	#var Global1 = Global.new()
	
	var b1 := "SMHL"
	var b = Globals.loader("res://resources/textures/zombs/Bullets/" ,["small","shell","medium","heavy"], b1, "png")
	print(b)
	var a : Array[Node] = get_children()
	var c : int = 0
	#var d : Dictionary
	
	for i in a:	
		var l  : TextureRect = a[c].get_child(1) # TODO
		
		l.texture = b[b1[c]]  # TextureRect
		l.expand_mode = TextureRect.EXPAND_IGNORE_SIZE 
		l.size = Vector2(40,40)
		c+=1
		

func _process(_delta: float) -> void:
	pass








#"small medium heavy shell"
# SMHL
#var jio : Dictionary = { "S":null, "M":null, "H":null, "L":null}

#@export var S_text : Texture2D 
#@export var M_text : Texture2D 
#@export var H_text : Texture2D 
#@export var L_text : Texture2D



#var S : TextureRect = get_child(0).get_child(1)
#var M : TextureRect = get_child(1).get_child(1)
#var H : TextureRect = get_child(2).get_child(1)
#var L : TextureRect = get_child(3).get_child(1)

	#S.texture = S_text 
	#M.texture = M_text 
	#H.texture = H_text 
	#L.texture = L_text
