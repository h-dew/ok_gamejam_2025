extends CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var center = get_position()
	center = Vector2i(center.x / 6, center.y / 6)
	
	var rad = $"../Sprite2D".scale.x
	var wavetex = $"../../../../../".wavetex

	$"../../".health -= wavetex.buffer2[center.x + center.y * wavetex.resXs]
	
	if int($"../../".health) <= 1:
		get_tree().change_scene_to_file("res://game_modes/visual_novel/visual_novel.tscn")
