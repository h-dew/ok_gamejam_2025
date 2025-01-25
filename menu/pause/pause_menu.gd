extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_pause_button_pressed():
	get_tree().paused = true
	$pause_button_container.visible = true
	show()
