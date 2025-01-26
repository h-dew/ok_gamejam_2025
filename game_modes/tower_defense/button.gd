extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _pressed() -> void:
	var post = $"../SubViewportContainer/SubViewport/WaveTable".buffer2
	var pre = $"../SubViewportContainer/SubViewport/WaveTable".buffer1
	
	post.slice(post.size() / 3, post.size() / 2).fill(2^54)
	pre.slice(post.size() / 3 + get_viewport().size.x, post.size() / 2).fill(2^54)
