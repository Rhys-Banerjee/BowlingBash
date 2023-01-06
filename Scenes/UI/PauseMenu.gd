extends CanvasLayer

signal timeRanOut

onready var continueButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/PlayButton
onready var restartButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/RestartButton
onready var exitButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/LevelSelect
onready var optionsButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/OptionsButton
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	continueButton.connect("pressed", self, "on_continue_pressed")
	restartButton.connect("pressed", self, "on_restart_pressed")
	exitButton.connect("pressed", self, "on_exit_pressed")
	optionsButton.connect("pressed", self, "on_options_pressed")
	get_tree().paused = true

func unpause():
	queue_free()
	get_tree().paused = false

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		unpause()
		get_tree().set_input_as_handled()

func on_restart_pressed():
	unpause()
	emit_signal("timeRanOut")

func on_continue_pressed():
	unpause()

func on_options_pressed():
	pass
	
func on_quit_pressed():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
