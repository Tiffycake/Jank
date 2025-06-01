extends Control

var port := 4631
var peer := ENetMultiplayerPeer.new()
var playerScene : PackedScene = preload("res://scenes/player.tscn")
@onready var hostButton := $"hostButton"
@onready var joinButton := $"joinButton"
@onready var playerList := $"../playerList"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hostButton.pressed.connect(hostButtonPressed)
	joinButton.pressed.connect(joinButtonPressed)

func hostButtonPressed():
	print("hostButtonPressed")
	peer.create_server(port)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(spawnPlayer)
	spawnPlayer()

func spawnPlayer(id = 1):
	var player = playerScene.instantiate()
	#self.add_child(player)
	player.name = str(id)
	call_deferred("add_child",player)
	player.add_child(playerList)
	

func playerJoin(id = 1):
	spawnPlayer()

func joinButtonPressed():
	print("joinButtonPressed")
	peer.create_client("localhost",port)
	multiplayer.multiplayer_peer = peer
