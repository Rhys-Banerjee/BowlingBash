extends CanvasLayer


onready var level1 = $MarginContainer/VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/Level1Button 
onready var level2 = $MarginContainer/VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/Level2Button 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	level1.connect("pressed", self, "on_play1_pressed")
	level2.connect("pressed", self, "on_play2_pressed")
	$Node2D/Camera2D.apply_shake(1)

func on_play1_pressed():
	$"/root/LevelManager".change_level(0)

func on_play2_pressed():
	$"/root/LevelManager".change_level(1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
