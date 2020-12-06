extends Control

func _on_Start_pressed():
	return get_tree().change_scene("res://Scenes/World.tscn")
func _on_Quit_pressed():
	return get_tree().quit()
