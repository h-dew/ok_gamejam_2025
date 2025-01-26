extends "res://game_modes/tower_defense/towers/turrets.gd"
	
func _ready() -> void:
	damage = float(GameData.tower_data["circle_t1"]["damage"]) / 128.0
	rate = int((1.0 / float(GameData.tower_data["circle_t1"]["rate"])) * 90)
	
	wavetex = $"../../../../GameScene".wavetex
	pos = get_position()

func _process(_delta: float) -> void:
	if Engine.get_frames_drawn() % rate == 0:
		wavetex.drawSquare(damage, Vector2i(pos.x / 6, pos.y / 6), Vector2i(2, 2), Vector2i(0,0))
