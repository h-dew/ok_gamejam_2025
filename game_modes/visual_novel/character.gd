extends Node2D

@onready var sprite = $Sprite2D

const characters = {
	"Sayori": preload("res://game_modes/visual_novel/images/test_char.png"),
	"Mike Wazowski": preload("res://game_modes/visual_novel/images/test_char02.png")
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func change_character(character_name: String):
	if character_name == "mc":
		print("mc speaking")
	else:
		sprite.texture = characters[character_name]
