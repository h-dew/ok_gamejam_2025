extends Control

@onready var dialogue = $DialogueBox/Dialogue
@onready var speaker = $SpeakerBox/Speaker

const ANIMATION_SPEED : int = 30
var animate_text : bool = false
var current_characters : int = 0

func _process(delta):
	if animate_text:
		if dialogue.visible_ratio < 1:
			dialogue.visible_ratio += (1.0/dialogue.text.length()) * (ANIMATION_SPEED * delta)
			current_characters = dialogue.visible_characters
		else:
			animate_text = false

func change_line(current_speaker: String, line: String):
	speaker.text = current_speaker
	current_characters = 0
	dialogue.text = line
	dialogue.visible_characters = 0
	animate_text = true
