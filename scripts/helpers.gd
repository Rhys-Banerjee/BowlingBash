extends Node

func apply_camera_shake(percentage):
	var cameras = get_tree().get_nodes_in_group("camera")
	if (cameras.size() > 0):
		cameras[0].apply_event_shake(percentage)

func apply_regular_camera_shake(percentage):
	var cameras = get_tree().get_nodes_in_group("camera")
	if (cameras.size() > 0):
		cameras[0].apply_shake(percentage)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
