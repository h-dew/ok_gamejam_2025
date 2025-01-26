extends Sprite2D

var wavetable
	# change to monochrome for uploading to gpu
var image
var resX
var resY

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	resX = get_viewport().size.x
	resY = get_viewport().size.y
	
	image = Image.new().create(resX, resY, false,  4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	wavetable = $"../WaveTable".buffer2
	
	print(wavetable[wavetable.size() / 2])
	
	for i in wavetable.size():
		image.set_pixel(i % resX, i / resX, Color(wavetable[i], wavetable[i], wavetable[i])) 
	
	texture = ImageTexture.create_from_image(image)
