extends Control

var port := 25565 # minecraft port lmao
var peer := ENetMultiplayerPeer.new()
var playerScene : PackedScene = preload("res://scenes/player.tscn")
@onready var hostButton := $"hostButton"
@onready var joinButton := $"joinButton"
@onready var playerList := $"../playerList"

func hostButtonPressed():
	print("hostButtonPressed")
	peer.create_server(port)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(spawnPlayer)
	spawnPlayer()

func joinButtonPressed():
	print("joinButtonPressed")
	peer.create_client("localhost",port)
	multiplayer.multiplayer_peer = peer
 
func spawnPlayer(id = 1):
	var player = playerScene.instantiate()
	player.name = str(id)
	var mainScene = get_parent()
	playerList.call_deferred("add_child", player)  #mainScene
	#player.add_child(playerList)

func _ready() -> void:
	#connects signals
	hostButton.pressed.connect(hostButtonPressed)
	joinButton.pressed.connect(joinButtonPressed)
	#hide()
