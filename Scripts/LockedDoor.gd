extends KinematicBody2D


func _process(delta):
	if Input.is_action_just_pressed("ui_press_z"):
		#yield(get_tree().create_timer(1.5),"timeout")
		queue_free()

