extends PathFollow2D

var speed = 150
var health = 10

func _physics_process(delta: float):
	print(health)
	move(delta)
	
func move(delta):
	set_progress(get_progress() + speed * delta)
