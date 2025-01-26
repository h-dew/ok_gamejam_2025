extends "res://game_modes/tower_defense/towers/turrets.gd"

func _ready() -> void:
	damage = float(GameData.tower_data["square_t1"]["damage"]) / 128.0
	rate = int((1.0 / float(GameData.tower_data["square_t1"]["rate"])) * 90)
	
	wavetex = $"../../../../GameScene".wavetex
	pos = get_position()
	

func _process(_delta: float) -> void:
	var len = 20;
	
	if Engine.get_frames_drawn() % rate == 0:
		wavetex.drawLine(damage, Vector2i(pos.x / 6 - len, pos.y / 6 - len), Vector2i(pos.x / 6 + len, pos.y / 6 - len), Vector2i(0,0))
		wavetex.drawLine(damage, Vector2i(pos.x / 6 + len, pos.y / 6 - len), Vector2i(pos.x / 6 + len, pos.y / 6 + len), Vector2i(0,0))
		wavetex.drawLine(damage, Vector2i(pos.x / 6 + len, pos.y / 6 + len), Vector2i(pos.x / 6 - len, pos.y / 6 + len), Vector2i(0,0))
		wavetex.drawLine(damage, Vector2i(pos.x / 6 - len, pos.y / 6 + len), Vector2i(pos.x / 6 - len, pos.y / 6 - len), Vector2i(0,0))
