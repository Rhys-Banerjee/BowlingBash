extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const MAX_SPEED = 700
const ACCELERATION = 150
const FRICTION = 50

var localScore = 0
var visited = []
signal increase_Player_score

var velocity = Vector2.ZERO

func _has_collided():
	#figure out if we've already collided with an object
	pass

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity += input_vector * ACCELERATION * delta
		velocity = velocity.clamped(MAX_SPEED)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	velocity = move_and_slide(velocity)
	
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("Pin") and !visited.has(collision.collider.name):
			localScore += 1
			emit_signal("increase_Player_score")
			if !visited.has(collision.collider.name):
				visited.append(collision.collider.name)
			print(localScore)
