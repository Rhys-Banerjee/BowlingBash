extends KinematicBody2D

signal died

const MAX_SPEED = 1200
const ACCELERATION = 800
const FRICTION = 50

onready var isOnPlatform = true
onready var isDead = false

onready var ballAnimations = $ballAnimations #animationPlayer
onready var ballMovements = $ballMovement #animationTree
onready var animationState = ballMovements.get("parameters/playback")

var localScore = 0
var visited = []
signal increase_Player_score
var hasTimerStarted = false
var velocity = Vector2.ZERO
var hasExitedPlatform = false

func _ready():
	$platformHitbox.connect("area_exited", self, "on_area_exited")
	$platformHitbox.connect("area_entered", self, "on_area_entered")

func on_area_exited(area2d):
	if $jump_timer.time_left == 0:
		emit_signal("died")
	else:
		hasExitedPlatform = true

func on_area_entered(area2d):
	hasExitedPlatform = false

func get_position():
	return position
	
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized()
	if Input.is_action_pressed("space"):
		$AnimationPlayer.play("jump")
		inAir()
	$deathBox/CollisionShape2D.set("disabled", false)
	$pinHitbox/CollisionShape2D.set("disabled", false)
	if hasExitedPlatform and $jump_timer.time_left == 0:
		emit_signal("died")
	if input_vector != Vector2.ZERO:
		ballMovements.set("parameters/Idle/blend_position", input_vector)
		ballMovements.set("parameters/Rolling/blend_position", input_vector)
		animationState.travel("Rolling")
		velocity += input_vector * ACCELERATION * delta
		velocity = velocity.clamped(MAX_SPEED)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	velocity = move_and_slide(velocity)
		#if collision.collider.is_in_group("platforms"):
		#	print("")

func inAir():
	$jump_timer.start()
	if $jump_timer.time_left > 0:
		$pinHitbox/CollisionShape2D.set_deferred("disabled", true) 
		$deathBox/CollisionShape2D.set_deferred("disabled", true)
