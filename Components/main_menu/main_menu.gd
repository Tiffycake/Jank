extends Control

var port := 25565 # minecraft port lmao
var peer := ENetMultiplayerPeer.new()
@export var playerScene : PackedScene 
@onready var hostButton := $"hostButton"
@onready var joinButton := $"joinButton"
@onready var body_color: ColorPicker = $bodyColor
@onready var hands_color: ColorPicker = $handsColor
@onready var username: LineEdit = $username

var objectList : Node
const buttonScale := Vector2(0.3, 0.3)
const buttonHoverScale := Vector2(0.32, 0.32)
 
	

func hostButtonPressed(): 
	updatePlayerInfo()
	#print("hostButtonPressed")
	peer.create_server(port)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(spawnPlayer)
	spawnPlayer()
	process_mode = Node.PROCESS_MODE_DISABLED
	hide()

func joinButtonPressed():
	updatePlayerInfo()
	peer.create_client("localhost",port)
	multiplayer.multiplayer_peer = peer
	process_mode = Node.PROCESS_MODE_DISABLED
	hide()
 
func spawnPlayer(id = 1):
	var player = playerScene.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
	player.name = str(id)
	player.id = str(id)
	objectList.call_deferred("add_child", player)  #mainScene
	#player.add_child(playerList)

func tweenMaker(object,variant) -> Callable:
	var outputFunc = func outputFunc():
		var tween = get_tree().create_tween()
		tween.tween_property(object, "scale", variant, 0.1)
	return outputFunc

func updatePlayerInfo() -> void:
	Globals.bodyColor = body_color.color
	Globals.handsColor = hands_color.color
	if username.text != "":
		Globals.username = username.text
	else:
		Globals.username = ":3"
func _ready() -> void:
	hostButton.pressed.connect(hostButtonPressed)
	joinButton.pressed.connect(joinButtonPressed)
	
	objectList = $"../WorldMap/objectList"

	hostButton.mouse_entered.connect(tweenMaker(hostButton,buttonHoverScale))
	joinButton.mouse_entered.connect(tweenMaker(joinButton,buttonHoverScale))
	hostButton.mouse_exited.connect(tweenMaker(hostButton,buttonScale))
	joinButton.mouse_exited.connect(tweenMaker(joinButton,buttonScale))
