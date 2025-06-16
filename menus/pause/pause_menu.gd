extends Control
	
func _on_pause_button_pressed():
	get_tree().paused = true
	$pause_button_container.visible = true
	show()
