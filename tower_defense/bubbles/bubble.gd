extends PathFollow2D

var speed = 150
var hp = 50

func _physics_process(delta: float):
	move(delta)
	
func move(delta):
	set_progress(get_progress() + speed * delta)

func on_hit(damage):
	hp -= damage
	if hp <= 0:
		on_destroy()
		
func on_destroy():
	get_child(0).queue_free()
