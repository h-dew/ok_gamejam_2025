extends Node

# Instantiate buffers
var buffer1: Array[int]
var buffer2: Array[int]

# Buffer Resolution
var xRes
var yRes

# Damping Value
var damping: float = 0.9

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Buffer size
	xRes = get_viewport().size.x / 2
	yRes = get_viewport().size.y / 2

	buffer1.resize(xRes * yRes)
	
	for i in range(xRes*yRes):
		buffer1[i] = 0
		
	# Duplicate to buffer2 as it is identical to buffer1 at the moment
	buffer2 = buffer1.duplicate(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var x = xRes
	
	# Swap buffers
	var temp = buffer1
	buffer1 = buffer2
	buffer2 = temp
	
	for i in range(x, buffer1.size() - x):
		buffer2[i] = ((buffer1[i-1] + 
			buffer1[i+1] +
			buffer1[i+x] +
			buffer1[i-x] ) >> 1)  - buffer2[i]
		# change shift amount to change damping
		buffer2[i] -= (buffer2[i] >> 2)
