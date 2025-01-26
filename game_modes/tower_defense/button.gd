extends Button

func _pressed() -> void:
	var post = $"../SubViewportContainer/SubViewport/TextureRect".drawSquare(Vector2i(160, 100), Vector2i(3, 3))
