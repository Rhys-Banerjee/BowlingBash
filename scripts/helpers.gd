extends Node

func apply_camera_shake(percentage):
	var cameras = get_tree().get_nodes_in_group("camera")
	if (cameras.size() > 0):
		cameras[0].set_CurrentShakePercentage(0)
		cameras[0].apply_event_shake(percentage)
		
		var cameraTimer := Timer.new()
		add_child(cameraTimer)
		cameraTimer.wait_time = 0.5
		cameraTimer.one_shot = true
		cameraTimer.start()
		cameraTimer.connect("timeout", self, "_on_timer_timeout")

func apply_regular_camera_shake(percentage):
	var cameras = get_tree().get_nodes_in_group("camera")
	if (cameras.size() > 0):
		cameras[0].set_eventCurrentShakePercentage(0)
		cameras[0].apply_shake(percentage)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_timer_timeout() -> void:
	$"/root/Helpers".apply_regular_camera_shake(1)
