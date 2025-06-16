extends Button

func _pressed() -> void:
	get_parent().visible = false
	get_tree().paused = false
	show()
