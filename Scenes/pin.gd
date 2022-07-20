extends Node2D



func _ready():
	add_to_group("pin")
	$hitbox.connect("area_entered", self, "on_area_entered")

func on_area_entered(area2d):
	print("pin hit")
	$AnimatedSprite.play("knocked")
	$AnimationPlayer.play("knocked")
	disable_pickup()
	var baseLevel = get_tree().get_nodes_in_group("base_level")[0]
	baseLevel.pin_collected()

func disable_pickup():
	$hitbox/CollisionShape2D.disabled = true
	$hitbox.set_collision_mask_bit(1,false)
	$hitbox.set_collision_layer_bit(1,false)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

