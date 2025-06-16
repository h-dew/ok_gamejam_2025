extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start(Dialogic.VAR.get('finalRoute'))


func _on_dialogic_signal(argument:String):
	if argument == "end_act_07":
		get_tree().change_scene_to_file("res://menus/main/main_menu.tscn")
