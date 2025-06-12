extends Control

var port := 25565 # minecraft port lmao
var peer := ENetMultiplayerPeer.new()
var playerScene : PackedScene = preload("res://scenes/player.tscn")
@onready var hostButton := $"hostButton"
@onready var joinButton := $"joinButton"
@onready var objectList := $"../objectList"

const buttonScale := Vector2(0.3, 0.3)
const buttonHoverScale := Vector2(0.32, 0.32)

func hostButtonPressed():
	print("hostButtonPressed")
	peer.create_server(port)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(spawnPlayer)
	spawnPlayer()
	process_mode = Node.PROCESS_MODE_DISABLED
	hide()

func joinButtonPressed():
	print("joinButtonPressed")
	peer.create_client("localhost",port)
	multiplayer.multiplayer_peer = peer
	process_mode = Node.PROCESS_MODE_DISABLED
	hide()
 
func spawnPlayer(id = 1):
	var player = playerScene.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)  # 1
	# GEN_EDIT_STATE_INSTANCE
	# PackedScene.GenEditState
	player.name = str(id)
	#var mainScene = get_parent()  ||| !!! |||
	objectList.call_deferred("add_child", player)  #mainScene
	#player.add_child(playerList)

func hostHover():
	var tween = get_tree().create_tween()
	tween.tween_property(hostButton, "scale", buttonHoverScale, 0.1)

func joinHover():
	var tween = get_tree().create_tween()
	tween.tween_property(joinButton, "scale", buttonHoverScale, 0.1)

func hostReset():
	var tween = get_tree().create_tween()
	tween.tween_property(hostButton, "scale", buttonScale, 0.1)

func joinReset():
	var tween = get_tree().create_tween()
	tween.tween_property(joinButton, "scale", buttonScale, 0.1)

func _ready() -> void:
	#connects signals
	hostButton.pressed.connect(hostButtonPressed)
	joinButton.pressed.connect(joinButtonPressed)
	hostButton.mouse_entered.connect(hostHover)
	joinButton.mouse_entered.connect(joinHover)
	hostButton.mouse_exited.connect(hostReset)
	joinButton.mouse_exited.connect(joinReset)
	#hide()
