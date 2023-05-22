extends MarginContainer

signal percentageChanged
var currentPercentage = 1.0

func _ready():
	$HBoxContainer/SubtractButton.connect("pressed", self, "on_button_pressed", [-.1])
	$HBoxContainer/PlusButton.connect("pressed", self, "on_button_pressed", [.1])
	$HBoxContainer/num.text = str(currentPercentage * 10)
	
func on_button_pressed(change):
	$ButtonClicker.play()
	currentPercentage = clamp(currentPercentage + change, 0, 1)
	$HBoxContainer/num.text = str(currentPercentage * 10)
	emit_signal("percentageChanged", currentPercentage)