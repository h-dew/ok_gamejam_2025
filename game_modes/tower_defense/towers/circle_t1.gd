extends "res://game_modes/tower_defense/towers/turrets.gd"

func _process(_delta: float) -> void:
	var wavetex = "res://game_modes/tower_defense/texture_rect.gd"
	var pos = get_position()
	
	if Engine.get_frames_drawn() % 60 == 0:
		wavetex.drawSquare(0.1, Vector2i(pos.x / 6, pos.y / 6), Vector2i(2, 2), Vector2i(0,0))
