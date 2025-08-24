extends CharacterBody2D 
class_name Player

#region vector stuffss
@export var inputVel := Vector2.ZERO
@export var pushVel := Vector2.ZERO
var inputDir : Vector2
#endregion
#region Nodes
#var camera : Camera2D = Camera2D.new()
@onready var coolBox : CollisionShape2D  = $"CollisionBox2D" # :sunglasses:
@onready var objectList: Node = $"../../objectList"
@onready var hitbox : HitboxComponent = $"HitboxComponent"
@onready var sprite: Sprite2D = $"Sprite2D"
@onready var HUD : = $HUD
@onready var inventory : Inventory = $"Inventory"
@onready var username: Label = $usernameHandler/username
@onready var camera_2d: Camera2D = $Camera2D

#endregion
#region 
var speed: = 600
var id : int
var inp_arr : PackedStringArray = ["slot0","slot1","slot2","slot3","slot4"]

const maxScale := 1.0
const minScale := 0.75
const scale_factor := 3.5

var attack_action	: bool
var use_action		: bool
var pickup_action	: bool
#endregion

var pickup_timer : Timer = Timer.new()

func _ready() -> void: 
	sprite.setSkin(Globals.bodyColor, Globals.handsColor)
	username.text = Globals.username
	if is_multiplayer_authority():
		#add_child(camera)
		HUD.visible = true
	else:
		camera_2d.queue_free()
	
	#print( get_tree().root )
	
	add_child(pickup_timer)
	pickup_timer.one_shot = true
	pickup_timer.wait_time = 0.1
	

func getInput(): # ref do smth 😭
	# rewrite this fuckass funciton (more like clean it up!!)
	# no, actually rewrite it 😭
	# release me :LunaCry:
	if DisplayServer.window_is_focused():
		look_at(get_global_mouse_position())
	attack_action = Input.is_action_pressed("leftClick")
	use_action    = Input.is_action_pressed("rightClick")
	pickup_action = Input.is_action_pressed("pickup")
	inputDir = Input.get_vector("left","right","up","down")
	inputVel = inputDir * speed
	
	if Input.is_action_just_released("srollUp") : 
		inventory.selectItem(inventory.selectedSlot-1)
		
	elif Input.is_action_just_released("srollDown"):
		inventory.selectItem(inventory.selectedSlot+1)
	
	
	for i in range(len(inp_arr)): # try reading this lmao 😭
		if Input.is_action_pressed(inp_arr[i]):
			inventory.selectItem(inp_arr.find("slot"+str(i)))
	
	pickup()

	if inventory.selectedItem != null:
		if attack_action and inventory.selectedNode.has_method("fire"):
			inventory.selectedNode.fire()
		
		elif use_action and inventory.selectedNode.has_method("reload"):
			inventory.selectedNode.reload()

func pickup():
	if pickup_action and pickup_timer.time_left == 0 :
		hitbox.eat_thingies()
		pickup_timer.start()

func _physics_process(delta: float) -> void:
	if is_multiplayer_authority():
		getInput()
	
	velocity = inputVel + pushVel
	push()
	pushVel.x = move_toward(pushVel.x, 0, 5000 * delta)
	pushVel.y = move_toward(pushVel.y, 0, 5000 * delta)
	squish(delta)
	move_and_slide()

func push():
	for i in get_slide_collision_count():
		var col := get_slide_collision(i)
		if(col.get_collider() is Player):
			col.get_collider().pushVel = velocity/3

func squish(delta: float) -> void:
	for index in get_slide_collision_count():
		var collision := get_slide_collision(index)
		if(collision.get_collider() is Player):
			return

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
	set_multiplayer_authority(int(name))

func die() -> void:
	get_node("/root/Node2D/MainMenu").respawn(self)
