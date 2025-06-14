extends CharacterBody2D 

var speed: = 600
@onready var sprite: Sprite2D = $"Sprite2D"
@onready var HUD : = $HUD
var currentSlot : = 1
var selectedItem : Node2D
var slotList : Array
#@onready var inventory: Node2D = $Inventory
#@onready var weapon: Node2D = inventory.get_child(0)
#@onready var wallPlacer: Node2D = inventory.get_child(1)

@onready var objectList: Node = $"../../objectList"

var camera : Camera2D = Camera2D.new()

@onready var coolBox : CollisionShape2D  = $"CollisionBox2D" # :sunglasses:

const maxScale := 1.0
const minScale := 0.75
const scale_factor := 3.5
#region inputs
var inputDir : Vector2
var attack   : bool
var use      : bool
#endregion
func _ready() -> void:
	
	sprite.setSkin(Globals.bodyColor, Globals.handsColor)
	
	for i in get_children():
		if str(i.name).contains("Slot"):
			slotList.append(i)
		
	selectItem(currentSlot)
	if is_multiplayer_authority():
		add_child(camera)
		HUD.visible = true
		
	self.tree_exited.connect(die)
	
	sprite.gunEquiped() 

func getInput():
	if DisplayServer.window_is_focused():
		look_at(get_global_mouse_position())
	attack = Input.is_action_pressed("leftClick")
	use    = Input.is_action_pressed("rightClick")
	inputDir = Input.get_vector("left","right","up","down")
	velocity = inputDir * speed

 
	if Input.is_action_just_released("srollUp") :
		print("srollUp")
		selectItem(currentSlot+1)
	elif Input.is_action_just_released("srollDown"):
		print("srollDown")
		selectItem(currentSlot-1)


	if attack == true:
		selectedItem.fire()

	#if attack == true:
		#weapon.fire()
	 

func _physics_process(delta: float) -> void:
	if is_multiplayer_authority():
		getInput()
	squish(delta)
	move_and_slide()

func squish(delta) -> void:
	if (is_on_wall()):
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
 
func selectItem(n) -> void:
	if n > 1 and slotList.size() > n:  # true: # n > 1 : # or n < slotList.size()+1    :
		print("selecting #",n," slot")
		currentSlot = n
		for i in slotList:
			if str(i.name) == "Slot"+ str(currentSlot) :
				selectedItem.unEquiped()
				selectedItem = i.get_child(0)
				selectedItem.equiped()
				print(i)
				print(i.get_child(0))
	


func _process(_delta: float) -> void:
	pass

func die() -> void:
	pass


"""
var counter : int = 0
func balls() -> void:
	if counter == 60:
		sprite.setSkin(Color(255,255,0))
	elif counter == 120:
		sprite.setSkin(Color(0,0,255))
		counter = 0
	counter+=1
"""
