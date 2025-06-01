extends Control


var peer := ENetMultiplayerPeer.new()
var playerScene : PackedScene = preload("res://scenes/player.tscn")
@onready var hostButton := $"hostButton"
@onready var joinButton := $"joinButton"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hostButton.pressed.connect(hostButtonPressed)
	joinButton.pressed.connect(joinButtonPressed)

func hostButtonPressed():
	print("hostButtonPressed")
	peer.create_server(135)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(spawnPlayer)
	spawnPlayer()
	
func joinButtonPressed():
	print("joinButtonPressed")
	peer.create_client("localhost",135)
	multiplayer.multiplayer_peer = peer


func spawnPlayer(id = 1):
	var player = playerScene.instantiate()
	#self.add_child(player)
	player.name = str(id)
	call_deferred("add_child",player)
	
	
