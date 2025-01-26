extends Node2D

func _input(event):
	if event.is_action_pressed("pause"):
		print("paused")
		$Pause_Menu._on_pause_button_pressed()
