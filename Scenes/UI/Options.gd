extends CanvasLayer

onready var backButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/Button
onready var SFXRangeControl = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/SFXVolControl/RangeControl
onready var MusicRangeControl = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/MusicVolControl/RangeControl

signal back_pressed
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	backButton.connect("pressed", self, "on_back_pressed")
	MusicRangeControl.connect("percentageChanged", self, "on_music_percentage_changed")
	SFXRangeControl.connect("percentageChanged", self, "on_SFX_percentage_changed")

func update_bus_volume(busName, volumePercent):
	var busIndex = AudioServer.get_bus_index(busName)
	var volumeDb = linear2db(volumePercent)
	AudioServer.set_bus_volume_db(busIndex, volumeDb)

func on_back_pressed():
	emit_signal("back_pressed")

func on_music_percentage_changed(percent):
	update_bus_volume("Music", percent)

func on_SFX_percentage_changed(percent):
	update_bus_volume("SFX", percent)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
