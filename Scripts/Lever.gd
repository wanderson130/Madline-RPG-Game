extends Area2D

signal lever_moved

func _on_lever_body_entered(body : PhysicsBody2D)->void:
		if body.is_in_group("player"):
			emit_signal("lever_moved")
			if Input.is_action_just_pressed("ui_press_z"):
				$AnimatedSprite2.play("lever")
				yield(get_tree().create_timer(1.0),"timeout")
				$AnimatedSprite2.stop()
