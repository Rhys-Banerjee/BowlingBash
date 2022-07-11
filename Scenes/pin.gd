extends StaticBody2D



func _ready():
	add_to_group("pin")
	$hitbox.connect("area_entered", self, "on_area_entered")

func on_area_entered(area2d):
	$AnimatedSprite.play("knocked")
	var baseLevel = get_tree().get_nodes_in_group("base_level")[0]
	baseLevel.pin_collected()

func disable_pickup():
	$hitbox/CollisionShape2D.disabled = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

