extends CharacterBody2D 
class_name Player


var speed: = 600
var id : int

#region
var camera : Camera2D = Camera2D.new()
@onready var coolBox : CollisionShape2D  = $"CollisionBox2D" # :sunglasses:
@onready var objectList: Node = $"../../objectList"
@onready var sprite: Sprite2D = $"Sprite2D"
@onready var HUD : = $HUD
@onready var inventory : = $"Inventory"

#var inventory : = Inventory.new() # preload("res://invItems/Inventory.tres")
#endregion

#region scales
const maxScale := 1.0
const minScale := 0.75
const scale_factor := 3.5
##endregion
##region inputs
var inputDir : Vector2
var attack   : bool
var use      : bool
##endregion
##region slots


#var slotList : Dictionary
#endregion


func _ready() -> void: 
	sprite.setSkin(Globals.bodyColor, Globals.handsColor)
	 
	#inventory.selectItem(0)
	
	if is_multiplayer_authority():
		add_child(camera)
		HUD.visible = true

func getInput():
	if DisplayServer.window_is_focused():
		look_at(get_global_mouse_position())
	attack = Input.is_action_pressed("leftClick")
	use    = Input.is_action_pressed("rightClick")
	inputDir = Input.get_vector("left","right","up","down")
	velocity = inputDir * speed
	
	if Input.is_action_just_released("srollUp") : 
		#print("srollUp")
		inventory.selectItem(inventory.selectedSlot-1)
	elif Input.is_action_just_released("srollDown"):
		#print("srollDown") 
		inventory.selectItem(inventory.selectedSlot+1)
	
	 
	if attack == true and inventory.selectedItem != null :
		if inventory.selectedItem.has_method("fire"):
			inventory.selectedItem.fire()

func _physics_process(delta: float) -> void:
	if is_multiplayer_authority():
		getInput()
	squish(delta)
	move_and_slide()

func squish(delta: float) -> void:
	if is_on_wall():
		var angle_to_wall = rad_to_deg(inputDir.angle_to(get_wall_normal()))
		if (angle_to_wall < 0): angle_to_wall = angle_to_wall * -1
		if(angle_to_wall > 130 and angle_to_wall < 230 and inputDir != Vector2(0,0)):
			if(coolBox.scale.x > minScale):
				coolBox.scale = Vector2(coolBox.scale.x - delta * scale_factor, coolBox.scale.y - delta * scale_factor)
		else:
			if(coolBox.scale.x < maxScale):
				coolBox.scale = Vector2(coolBox.scale.x + delta * scale_factor, coolBox.scale.y + delta * scale_factor)
	else:
		if(coolBox.scale.x < maxScale):
			coolBox.scale = Vector2(coolBox.scale.x + delta * scale_factor, coolBox.scale.y + delta * scale_factor)

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())
 

#func getInv() -> void:#
#	for i in get_children().slice(0,5):
#		slotList.set(int(str(i.name)[-1]),i)


		
		#if selectedItem != null: #if  i == currentSlot and selectedItem != null: # str(slotList[i].name) == "Slot"+ str(currentSlot) 



func _process(_delta: float) -> void:
	pass

func die() -> void:
	queue_free()





	#self.tree_exited
	#self.tree_exited.connect(die)

"""balls.rpc()
@rpc("any_peer", "call_local")
func balls(): 
	if sprite.modulate.r < 1:
		sprite.setSkin1(sprite.modulate+Color(0.1,0,0) )
	 



var counter : int = 0
func balls() -> void:
	if counter == 60:
		sprite.setSkin(Color(255,255,0))
	elif counter == 120:
		sprite.setSkin(Color(0,0,255))
		counter = 0
	counter+=1
"""
