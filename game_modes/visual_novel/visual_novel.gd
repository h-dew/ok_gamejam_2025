extends Node2D

var dialogue_index : int = 0

@onready var character = $CanvasLayer2/Control/Character
@onready var dialogue_ui = $CanvasLayer2/DialogueUI

const test_dialogue : Array[String] = [
	"Sayori:Nice to meet you Mike!",
	"Mike Wazowski:Boo!",
	"Sayori:I'm going to kill myself now."
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialogue_index = 0
	process_current_line()

func _input(event):
	if event.is_action_pressed("pause"):
		print("paused")
		$Pause_Menu._on_pause_button_pressed()
		
	if event.is_action_pressed("next_line"):
		if dialogue_index < len(test_dialogue) - 1:
			dialogue_index += 1
			process_current_line()
		
func parse_line(line: String):
	var line_info = line.split(":")
	assert(len(line_info) >= 2)
	return {
		"speaker": line_info[0],
		"dialogue": line_info[1]
	}
func process_current_line():
	var line = test_dialogue[dialogue_index]
	var line_info = parse_line(line)
	dialogue_ui.speaker.text = line_info["speaker"]
	dialogue_ui.dialogue.text = line_info["dialogue"]
	character.change_character(line_info["speaker"])
