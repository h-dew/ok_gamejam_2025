extends "res://game_modes/tower_defense/towers/turrets.gd"
	
func _ready() -> void:
	damage = float(GameData.tower_data["diamond_t1"]["damage"]) / 128.0
	rate = int((1.0 / float(GameData.tower_data["diamond_t1"]["rate"])) * 90)
	len = GameData.tower_data["diamond_t1"]["range"]
	wavetex = $"../../../../GameScene".wavetex
	pos = get_position()

func _process(_delta: float) -> void:
	if Engine.get_frames_drawn() % rate == 0:
		# Hex
		#wavetex.drawSquare(damage, Vector2i(pos.x / 6, pos.y / 6), Vector2i(2, 2), Vector2i(0,0))
		
		# Triangle 
		#var p1 = Vector2i((pos.x / 6) - len, (pos.y/6) + (len / 2))
		#var p2 = Vector2i((pos.x/6) + len, (pos.y/6) + (len / 2))
		#var p3 = Vector2i(pos.x / 6, pos.y / 6 - len / 2)
		
		#wavetex.drawLine(damage, p1, p2, Vector2i(0, -1))
		#wavetex.drawLine(damage, p2, p3, Vector2i(0, -1))
		#wavetex.drawLine(damage, p3, p1, Vector2i(0, -1))
		
		# Diamond
		var p3 = Vector2i(pos.x / 6, pos.y / 6 - len)
		var p4 = Vector2i(pos.x / 6, pos.y / 6 + len)
		
		wavetex.drawLine(damage, p3, p4, Vector2i(0, 0))
		
		#wavetex.drawLine(damage, Vector2i(pos.x/6, pos.y/6 - len), Vector2i(pos.x/6, pos.y/6+len), Vector2i(0, 0))
