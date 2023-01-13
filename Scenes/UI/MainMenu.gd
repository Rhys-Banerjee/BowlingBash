extends CanvasLayer


onready var playButton = $MarginContainer/VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/PlayButton
onready var optionsButton = $MarginContainer/VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/OptionsButton

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	playButton.connect("pressed", self, "on_play_pressed")
	$Node2D/Camera2D.apply_shake(1)

func on_play_pressed():
	$"/root/LevelManager".change_level(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
