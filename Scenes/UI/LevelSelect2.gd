extends CanvasLayer


onready var level1 = $MarginContainer/VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/Level1Button 
onready var level2 = $MarginContainer/VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/Level2Button 
onready var level3 = $MarginContainer/VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/Level3Button 
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var levels = [level1, level2, level3]
onready var num = 1

func connect_levels(level, num):
	var function = str("on_level", num, "_pressed")
	level.connect("pressed", self, function)
# Called when the node enters the scene tree for the first time.
func _ready():
	for level in levels:
		connect_levels(level, num)
		num += 1
	$Node2D/Camera2D.apply_shake(1)

func on_level1_pressed():
	$"/root/LevelManager".change_level(0)

func on_level2_pressed():
	$"/root/LevelManager".change_level(1)
	
func on_level3_pressed():
	$"/root/LevelManager".change_level(2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
