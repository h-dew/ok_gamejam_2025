extends Button

func _pressed() -> void:
	var post = $"../SubViewportContainer/SubViewport/TextureRect".drawLine(0.01, Vector2i(110, 100), Vector2i(100, 100), Vector2i(0, 0))
