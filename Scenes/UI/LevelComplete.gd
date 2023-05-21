extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var replay = $PanelContainer/MarginContainer/VBoxContainer/Replay
onready var exit = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/ExitButton
# Called when the node enters the scene tree for the first time.
func _ready():
	$PanelContainer/MarginContainer/VBoxContainer/NextLevel.connect("pressed", self, "on_next_button_pressed")
	replay.connect("pressed", self, "on_replay_button_pressed")
	exit.connect("pressed", self, "on_exit_button_pressed")
func on_next_button_pressed():
	$randomClick.play()
	$"/root/LevelManager".increment_level()
	 # Replace with function body.

func on_exit_button_pressed():
	$randomClick.play()
	$"/root/LevelManager".change_level(0)

func on_replay_button_pressed():
	$randomClick.play()
	queue_free()
	get_parent().get_tree().reload_current_scene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
