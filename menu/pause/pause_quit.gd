extends Button
	
func _pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu/main/main_menu.tscn")
