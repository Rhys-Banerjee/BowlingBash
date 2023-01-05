extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var animationPlayer = get_parent().get_node("AnimationPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("mouse_entered", self, "on_mouse_entered")
	connect("mouse_exited", self, "on_mouse_exited")
	connect("pressed", self, "on_button_pressed")
	
func on_mouse_entered():
	animationPlayer.play("hover")
func on_mouse_exited():
	animationPlayer.play_backwards("hover")
func on_button_pressed():
	animationPlayer.play("click")
	
