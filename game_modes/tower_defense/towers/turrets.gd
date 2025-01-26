extends Node2D

var wavetex
var pos = Vector2(0,0)
var rate
var damage
var len
	
func _physics_process(delta):
	turn()
	
func turn():
	var enemy_position = get_global_mouse_position()
	get_node("Base").look_at(enemy_position)
