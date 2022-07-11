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
	print(pinsLeft)

func pin_collected():
	collectedPins += 1
	emit_signal("pin_total_changed", totalPins, collectedPins)

func pin_total_changed(newTotal):
	totalPins = newTotal
	emit_signal("pin_total_changed", totalPins, collectedPins)
