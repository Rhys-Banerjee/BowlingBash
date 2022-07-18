extends Node2D

signal pin_total_changed

var playerScene = preload("res://scenes/ball.tscn")
var spawnPosition = Vector2.ZERO
var currentPlayerNode = null
var totalPins = 0
var collectedPins = 0
onready var pinsLeft = len(get_tree().get_nodes_in_group("pin"))


func _ready():
	 # Replace with function body.
	spawnPosition = $ball.global_position
	register_player($ball)
	print(pinsLeft)

func register_player(player):
	currentPlayerNode = player
	currentPlayerNode.connect("died", self, "on_player_died", [], CONNECT_DEFERRED)

func create_player():
	var playerInstance = playerScene.instance()
	add_child_below_node(currentPlayerNode, playerInstance)
	playerInstance.global_position = spawnPosition
	register_player(playerInstance)

func on_player_died():
	currentPlayerNode.queue_free()
	create_player()

func pin_collected():
	collectedPins += 1
	emit_signal("pin_total_changed", totalPins, collectedPins)

func pin_total_changed(newTotal):
	totalPins = newTotal
	emit_signal("pin_total_changed", totalPins, collectedPins)
