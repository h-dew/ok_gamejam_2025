extends Button

func _pressed() -> void:
	get_tree().change_scene_to_file("res://game_modes/visual_novel/visual_novel.tscn")
