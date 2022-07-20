extends KinematicBody2D

signal died

const MAX_SPEED = 1200
const ACCELERATION = 800
const FRICTION = 50

onready var isOnPlatform = true
onready var isDead = false
var localScore = 0
var visited = []
signal increase_Player_score

var velocity = Vector2.ZERO

func _ready():
	$platformHitbox.connect("area_exited", self, "on_area_exited")

func on_area_exited(area2d):
	print("hey")
	emit_signal("died")
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity += input_vector * ACCELERATION * delta
		velocity = velocity.clamped(MAX_SPEED)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	velocity = move_and_slide(velocity)
		#if collision.collider.is_in_group("platforms"):
		#	print("")
