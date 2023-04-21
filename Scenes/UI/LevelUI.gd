extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var baseLevels = get_tree().get_nodes_in_group("base_level")
	if (baseLevels.size() > 0):
		baseLevels[0].connect("pin_total_changed", self, "on_pin_total_changed")

func on_pin_total_changed(totalPins, collectedPins):
	$HBoxContainer/MarginContainer/Label.text = str(totalPins-collectedPins, " PINS LEFT")
	$Popups/Label.text = str(totalPins-collectedPins)
	if collectedPins == 0:
		$Popups/Label.text = str("GO!")
	$Popups/Label/AnimationPlayer.play("pinCollected")
	
func round_up(f):
	return int(f) + 1 if f > int(f) else int(f)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var timer = get_parent().get_node("LevelTimer")
	var levelNum = get_parent().get_node("LevelNumber")
	$HBoxContainer/MarginContainer2/Label.text = str(round_up(timer.time_left), " seconds")
	$HBoxContainer/MarginContainer3/Label.text = str("LEVEL ", int(levelNum.wait_time))
	

