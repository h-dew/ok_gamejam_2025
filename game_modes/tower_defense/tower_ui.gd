extends CanvasLayer

func set_tower_preview(tower_type, mouse_position):
	var drag_tower = load("res://game_modes/tower_defense/towers/" + tower_type + ".tscn").instantiate()
	drag_tower.set_name("DragTower")
	drag_tower.modulate = Color("00ff003c")
	
	var range_texture = Sprite2D.new()
	range_texture.position = Vector2(1,1)
	var scaling = GameData.tower_data[tower_type]["range"] / 600.0
	range_texture.scale = Vector2(scaling, scaling)
	var texture = load("res://game_modes/tower_defense/towers/range_display.png")
	range_texture.texture = texture
	range_texture.modulate = Color("00ff003c")

	var control = Control.new()
	control.add_child(drag_tower, true)
	control.add_child(range_texture, true)
	control.position = mouse_position
	control.set_name("TowerPreview")
	add_child(control, true)
	move_child(get_node("TowerPreview"), 0)

func update_tower_preview(new_position, colour):
	get_node("TowerPreview").position = new_position 	
	if get_node("TowerPreview/DragTower").modulate != Color(colour):
		get_node("TowerPreview/DragTower").modulate = Color(colour)
		get_node("TowerPreview/Sprite").modulate = Color(colour)
