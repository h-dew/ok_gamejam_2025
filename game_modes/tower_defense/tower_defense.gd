extends Node2D

func _input(event):
	if event.is_action_pressed("pause"):
		print("paused")
		$PauseMenu._on_pause_button_pressed()
