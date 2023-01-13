extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var replay = $PanelContainer/MarginContainer/VBoxContainer/Replay
# Called when the node enters the scene tree for the first time.
func _ready():
	$PanelContainer/MarginContainer/VBoxContainer/NextLevel.connect("pressed", self, "on_next_button_pressed")
	replay.connect("pressed", self, "on_replay_button_pressed")
func on_next_button_pressed():
	$"/root/LevelManager".increment_level()
	 # Replace with function body.

func on_replay_button_pressed():
	queue_free()
	get_parent().get_tree().reload_current_scene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
