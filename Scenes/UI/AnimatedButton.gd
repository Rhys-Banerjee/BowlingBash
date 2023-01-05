extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("mouse_entered", self, "on_mouse_entered")
	connect("mouse_exited", self, "on_mouse_exited")
	connect("pressed", self, "on_button_pressed")
	
func on_mouse_entered():
	$AnimationPlayer.play("hover")
func on_mouse_exited():
	$AnimationPlayer.play_backwards("hover")
func on_button_pressed():
	$AnimationPlayer.play("click")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
