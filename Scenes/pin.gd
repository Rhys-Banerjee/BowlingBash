extends Node2D

var pi = 3.14159265358979323846264

var originalPosition = position

func _ready():
	add_to_group("pin")
	$hitbox.connect("area_entered", self, "on_area_entered")

func on_area_entered(area2d):
	#$AnimatedSprite.play("knocked")
	#$"/root/Helpers".apply_camera_shake(1)
	$HitAudioPlayer.play()
	$pinAnimations.play("Knocked")
	#$AnimationPlayer.play("knocked")
	#var target = get_node("./ball").position.angle_to_point(position)
	var pos = get_tree().get_nodes_in_group("player")[0].position
	var target = pos.angle_to_point(position) - (pi/2)
	var ball_velocity = get_tree().get_nodes_in_group("player")[0].velocity
	var force = ball_velocity.length()/7
	var offset = Vector2(force, 0).rotated(target-(pi/2))
	translate(offset)
	# Rotate the pin's sprite using the angle in radians
	#$AnimatedSprite.rotate(target)
	$pins.rotate(target)
	#$AnimatedSprite.rotate(target)
	#https://godotengine.org/qa/75945/how-to-rotate-a-sprite-to-an-angle-linearly-not-lerping
	
	#$AnimatedSprite.rotate(2)
	call_deferred("disable_pickup")
	var baseLevel = get_tree().get_nodes_in_group("base_level")[0]
	baseLevel.call_deferred("pin_collected")

func disable_pickup():
	$hitbox/CollisionShape2D.disabled = true
	$hitbox.set_collision_mask_bit(1,false)
	$hitbox.set_collision_layer_bit(1,false)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

