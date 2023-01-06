extends KinematicBody2D

signal died
signal timeRanOut

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
var idleDeath = false

onready var levelTimer = get_parent().get_node("LevelTimer")

func _ready():
	$platformHitbox.connect("area_exited", self, "on_area_exited")
	$platformHitbox.connect("area_entered", self, "on_area_entered")
	$jump_timer.connect("timeout", self, "_on_jump_timer_timeout")

func on_area_exited(area2d):
	if $jump_timer.time_left == 0:
		idleDeath = true
		$death_timer.start()
		$death_timer.connect("timeout", self, "_on_timer_timeout")
		#get_parent().move_child(self, 3)
		#velocity = Vector2.ZERO
		$ballAnimations.play("death")
		animationState.travel("death")
		#emit_signal("died")
	else:
		hasExitedPlatform = true

func on_area_entered(area2d):
	hasExitedPlatform = false

func get_position():
	return position
	
func _physics_process(delta):
	if Input.is_action_just_pressed("space"):
			stuff()
	if levelTimer.time_left == 0:
		emit_signal("timeRanOut")
		levelTimer.start()
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized()
	#if Input.is_action_pressed("space"):
	#	#$"/root/Helpers".apply_camera_shake(1)
	#	$ballAnimations.play("jump")
	#	inAir()
	$deathBox/CollisionShape2D.set("disabled", false)
	$pinHitbox/CollisionShape2D.set("disabled", false)
	if hasExitedPlatform and $jump_timer.time_left == 0:
		var deathTimer = Timer.new()
		add_child(deathTimer)
		deathTimer.wait_time = 0.4
		deathTimer.one_shot = true
		deathTimer.start()
		deathTimer.connect("timeout", self, "_on_timer_timeout")
		#get_parent().move_child(self, 3)
		var collision_shape = get_node("pinHitbox/CollisionShape2D")
		collision_shape.set("disabled", true)
		velocity = Vector2.ZERO
		$ballAnimations.play("death")
		#if $death_timer.is_stopped():
		#	emit_signal("died")
	if input_vector != Vector2.ZERO:
		if Input.is_action_just_pressed("space"):
			#$"/root/Helpers".apply_camera_shake(1)
			ballAnimations.play("jump")
			inAir()
		ballMovements.set("parameters/jump/blend_position", input_vector)
		ballMovements.set("parameters/Idle/blend_position", input_vector)
		ballMovements.set("parameters/Rolling/blend_position", input_vector)
		ballMovements.set("parameters/death/blend_position", input_vector)
		animationState.travel("Rolling")
		velocity += input_vector * ACCELERATION * delta
		velocity = velocity.clamped(MAX_SPEED)
	elif input_vector == Vector2.ZERO and Input.is_action_just_pressed("space"):
		animationState.travel("jump")
	elif input_vector == Vector2.ZERO and idleDeath:
		print(idleDeath)
		ballMovements.set("parameters/death/blend_position", input_vector)
		animationState.travel("death")
		idleDeath = false
	else:
		if idleDeath:
			ballAnimations.play("death")
		else:
			animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	velocity = move_and_slide(velocity)
		#if collision.collider.is_in_group("platforms"):
		#	print("")
		
func _on_timer_timeout() -> void:
	emit_signal("died")
	#get_parent().move_child(self, 7)

func _on_jump_timer_timeout() -> void:
	if hasExitedPlatform:
		pass
		#emit_signal("died")
func stuff():
	#$"/root/Helpers".apply_camera_shake(1)
	ballAnimations.play("jump")
	inAir()
func inAir():
	$jump_timer.start()
	if $jump_timer.time_left > 0:
		$pinHitbox/CollisionShape2D.set_deferred("disabled", true) 
		$deathBox/CollisionShape2D.set_deferred("disabled", true)
