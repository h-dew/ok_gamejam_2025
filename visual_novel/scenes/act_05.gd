extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("act_05")


func _on_dialogic_signal(argument:String):
	if argument == "end_act_05":
		get_tree().change_scene_to_file("res://visual_novel/scenes/act_06.tscn")
