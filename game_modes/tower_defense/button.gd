extends Button

func _pressed() -> void:
	var post = $"../SubViewportContainer/SubViewport/TextureRect".drawSquare(0.1, Vector2i(160, 100), Vector2i(1, 1), Vector2i(10, 10))
