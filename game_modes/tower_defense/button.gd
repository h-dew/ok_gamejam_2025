extends Button

func _pressed() -> void:
	var post = $"../SubViewportContainer/SubViewport/TextureRect".drawTriangle(0.01, Vector2i(10, 100), Vector2i(30, 30), Vector2i(1, 0))
