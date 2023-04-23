extends CanvasLayer

onready var back = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer2/HBoxContainer3/HBoxContainer/TitleScreen
onready var level1 = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer2/HBoxContainer/Level1Button
onready var level2 = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer2/HBoxContainer/Level2Button 
onready var level3 = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer2/HBoxContainer/Level3Button
onready var level4 = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer2/HBoxContainer/Level4Button
onready var level5 = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer2/HBoxContainer/Level5Button
onready var level6 = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer2/HBoxContainer/Level6Button
onready var level7 = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer2/HBoxContainer/Level7Button
onready var level8 = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer2/HBoxContainer/Level8Button
onready var level9 = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer2/HBoxContainer/Level9Button
onready var level10 = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer2/HBoxContainer2/Level10Button
onready var level11 = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer2/HBoxContainer2/Level11Button
onready var level12 = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer2/HBoxContainer2/Level12Button
onready var level13 = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer2/HBoxContainer2/Level13Button
onready var level14 = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer2/HBoxContainer2/Level14Button
onready var level15 = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer2/HBoxContainer2/Level15Button
onready var level16 = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer2/HBoxContainer2/Level16Button
onready var level17 = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer2/HBoxContainer2/Level17Button
onready var level18 = $MarginContainer/VBoxContainer/PanelContainer/VBoxContainer2/HBoxContainer2/Level18Button
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var levels = [level1, level2, level3, level4, level5, level6, level7, level8, level9, level10,
level11, level12, level13, level14, level15, level16, level17, level18]
onready var num = 1

func connect_levels(level, num):
	var function = str("on_level", num, "_pressed")
	level.connect("pressed", self, function)
# Called when the node enters the scene tree for the first time.
func _ready():
	back.connect("pressed", self, "on_back_pressed")
	for level in levels:
		connect_levels(level, num)
		num += 1
	$Node2D/Camera2D.apply_shake(1)

func on_back_pressed():
	$"/root/LevelManager".change_level(19)

func on_level1_pressed():
	$"/root/LevelManager".change_level(1)

func on_level2_pressed():
	$"/root/LevelManager".change_level(2)
	
func on_level3_pressed():
	$"/root/LevelManager".change_level(3)

func on_level4_pressed():
	$"/root/LevelManager".change_level(4)
	
func on_level5_pressed():
	$"/root/LevelManager".change_level(5)

func on_level6_pressed():
	$"/root/LevelManager".change_level(6)

func on_level7_pressed():
	$"/root/LevelManager".change_level(7)

func on_level8_pressed():
	$"/root/LevelManager".change_level(8)

func on_level9_pressed():
	$"/root/LevelManager".change_level(9)

func on_level10_pressed():
	$"/root/LevelManager".change_level(10)

func on_level11_pressed():
	$"/root/LevelManager".change_level(11)

func on_level12_pressed():
	$"/root/LevelManager".change_level(12)

func on_level13_pressed():
	$"/root/LevelManager".change_level(13)

func on_level14_pressed():
	$"/root/LevelManager".change_level(14)

func on_level15_pressed():
	$"/root/LevelManager".change_level(15)

func on_level16_pressed():
	$"/root/LevelManager".change_level(16)

func on_level17_pressed():
	$"/root/LevelManager".change_level(17)
	
func on_level18_pressed():
	$"/root/LevelManager".change_level(18)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
