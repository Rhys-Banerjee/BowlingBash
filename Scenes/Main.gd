extends Node2D

signal pin_total_changed
signal coin_total_changed #delete later

var playerScene = preload("res://scenes/ball.tscn")
export(PackedScene) var levelCompleteScene

var spawnPosition = Vector2.ZERO
var currentPlayerNode = null
var totalPins = 0
var collectedPins = 0
var totalCoins = 0 #delete later
var collectedCoins = 0 #delete later
onready var pinsLeft = len(get_tree().get_nodes_in_group("pin"))


func _ready():
	 # Replace with function body.
	spawnPosition = $ball.global_position
	register_player($ball)
	pin_total_changed(pinsLeft)
	$LevelTimer.start()
	$"/root/Helpers".apply_regular_camera_shake(1)
	
func register_player(player):
	currentPlayerNode = player
	currentPlayerNode.connect("died", self, "on_player_died", [], CONNECT_DEFERRED)
	currentPlayerNode.connect("timeRanOut", self, "on_time_ran_out")
	
func create_player():
	var playerInstance = playerScene.instance()
	add_child_below_node(currentPlayerNode, playerInstance)
	playerInstance.global_position = spawnPosition
	register_player(playerInstance)

func on_player_died():
	if currentPlayerNode != null:
		currentPlayerNode.queue_free()
		create_player()

func on_time_ran_out():
	get_tree().reload_current_scene()
	

func pin_collected():
	collectedPins += 1
	pinsLeft -= 1
	emit_signal("pin_total_changed", totalPins, collectedPins)
	if pinsLeft == 0:
		player_won()

func pin_total_changed(newTotal):
	totalPins = newTotal
	emit_signal("pin_total_changed", totalPins, collectedPins)
	
func player_won():
	currentPlayerNode.disconnect("died", self, "on_player_died")
	currentPlayerNode.queue_free()
	$LevelTimer.set_paused(true)
	var levelComplete = levelCompleteScene.instance()
	add_child(levelComplete)
	#LevelManager.increment_level()

	
	#LevelManager.increment_level()
