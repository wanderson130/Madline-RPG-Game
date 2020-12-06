extends Area2D

func _on_Skull_body_entered(body):
	queue_free()
