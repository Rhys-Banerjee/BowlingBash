extends CanvasLayer

var optionsMenuScene = preload("res://scenes/UI/Options.tscn")
onready var playButton = $MarginContainer/VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/PlayButton
onready var optionsButton = $MarginContainer/VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/OptionsButton

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	playButton.connect("pressed", self, "on_play_pressed")
	optionsButton.connect("pressed", self, "on_option_pressed")
	$Node2D/Camera2D.apply_shake(1)

func on_play_pressed():
	$"/root/ClickSoundPlayer/Clicks".play()
	$"/root/LevelManager".change_level(0)

func on_option_pressed():
	$"/root/ClickSoundPlayer/Clicks".play()
	var optionsMenuInstance = optionsMenuScene.instance()
	add_child(optionsMenuInstance)
	optionsMenuInstance.connect("back_pressed", self, "on_options_back_pressed")
	$MarginContainer.visible = false

func on_options_back_pressed():
	$"/root/ClickSoundPlayer/Clicks".play()
	$Options.queue_free()
	$MarginContainer.visible = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
