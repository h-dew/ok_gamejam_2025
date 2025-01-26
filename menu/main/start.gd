extends Button

func _pressed() -> void:
	get_tree().change_scene_to_file("res://game_modes/tower_defense/tower_defense.tscn")
