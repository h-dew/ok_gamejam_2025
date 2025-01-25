extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _pressed() -> void:
	var post = $"../WaveTable".buffer2
	var peepee: int  = post.size() >> 1
	post[peepee] = 2^63-1
	post[peepee + 1] = 255
	post[peepee + 2] = 255
	post[peepee + 3] = 255
	post[peepee + 4] = 255
	post[peepee + 5] = 255
	post[peepee + 2 + 1152] = 255
	post[peepee + 3 + 1152] = 255
	post[peepee + 4 + 1152] = 255
	post[peepee + 1 + 1152] = 255
	post[peepee + 5 + 1152] = 255
	post[peepee + 1 + 2304] = 255
	post[peepee + 3 + 2304] = 255
	post[peepee + 4 + 2304] = 255
	post[peepee + 5 + 2304] = 255
	post = $"../WaveTable".buffer1
	peepee = (post.size() >> 1 ) - 1152
	post[peepee] = 255
	post[peepee + 1] = 255
	post[peepee + 2] = 255
	post[peepee + 3] = 255
	post[peepee + 4] = 255
	post[peepee + 5] = 255
	post[peepee + 2 + 1152] = 255
	post[peepee + 3 + 1152] = 255
	post[peepee + 4 + 1152] = 255
	post[peepee + 1 + 1152] = 255
	post[peepee + 5 + 1152] = 255
	post[peepee + 1 + 2304] = 255
	post[peepee + 2 + 2304] = 255
	post[peepee + 3 + 2304] = 255
	post[peepee + 4 + 2304] = 255
	post[peepee + 5 + 2304] = 255
