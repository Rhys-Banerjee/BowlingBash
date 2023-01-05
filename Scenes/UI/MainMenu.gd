extends CanvasLayer


onready var playButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/PlayButton
onready var optionsButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/OptionsButton

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	playButton.connect("pressed", self, "on_play_pressed")

func on_play_pressed():
	$"/root/LevelManager".change_level(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
