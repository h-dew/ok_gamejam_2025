extends TextureRect

var img: Image

var resX: int
var resY: int
var resXs: int
var resYs: int

var buffer1: Array[float]
var buffer2: Array[float]

func drawLine(intensity: float, from: Vector2i, to: Vector2i, velocity: Vector2i) -> void:
	# Only uses x component of scale
	var distance: int = max(abs(from.x - to.x), abs(from.y - to.y))
	var fromf = Vector2(max(min(from.x, resXs), 0), max(min(from.y, resYs), 0))
	var tof = Vector2(max(min(to.x, resXs), 0), max(min(to.y, resYs), 0))
	
	for x in distance + 1:
		var t: float
		if distance == 0:
			t = 0.0
		else:
			t = (float(x) / distance)
		
		var point = roundPoint(fromf.lerp(tof, t))
		var arrPos = (point.x) + (point.y) * resXs
		buffer2[arrPos] = intensity
		buffer1[(arrPos + velocity.x) + (resXs * velocity.y)] = intensity / 2

func drawSquare(intensity: float, pos: Vector2i, scale: Vector2i, velocity: Vector2i) -> void:
	for x in scale.x:
		for y in scale.y:
			var arrPos = (pos.x + x - scale.x) + (pos.y + (y - 1)) * resXs
			buffer2[arrPos] = intensity
			buffer1[(arrPos + velocity.x) + (resXs * velocity.y)] = intensity / 2
			
func roundPoint(point: Vector2) -> Vector2i:
	return Vector2i(int(point.x), int(point.y))
	
func drawTriangle(intensity: float, pos: Vector2i, scale: Vector2i, velocity: Vector2i) -> void:
	for i in scale.x:
		var arrPos = pos.x + i + pos.y * resXs
		buffer1[arrPos] = intensity
		buffer2[(arrPos + velocity.x) + (resXs * velocity.y)] = intensity
		
	for i in scale.y:
		var arrPos = pos.x + i * resXs + pos.y * resXs
		buffer1[arrPos] = intensity
		buffer2[(arrPos + velocity.x) + (resXs * velocity.y)] = intensity

func buffer_to_image(arr : Array[float]) -> Image:
	var xStep: int = resX / resXs
	var yStep: int = resY / resYs
	var square = Rect2i(0, 0, xStep, yStep)
	
	img = Image.create(resX, resY, false, Image.FORMAT_RGBA8)
	
	var r: int = 0
	var g: int = 0
	var b: int = 0
	var val: float
	
	for i in range(buffer2.size()):
		square.position = Vector2i((i % resXs) * xStep, int(i / resXs) * yStep)
		val = buffer2[i]
		
		if val >= 0:
			r = val * 255
			g = 0
		else:
			g = (val * (-1)) * 255
			r = 0
		b = 0
		
		img.fill_rect(square, Color(r, g, abs(val) * 255, 255))
		
	return img

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	resX = get_viewport().size.x
	resY = get_viewport().size.y
	
	# Simulation resolution
	resXs = 320
	resYs = 200
	
	buffer1.resize(resXs * resYs)
	
	buffer1.fill(0.0)
	
	buffer2 = buffer1.duplicate(true)
	
	
	#for i in 320:
		#buffer1[16000 + i] = 1.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# WAVE
	var temp = buffer1
	buffer1 = buffer2
	buffer2 = temp
	
	for i in range(resXs, (resYs * resXs) - resXs):
		buffer2[i] = ((buffer1[i - 1] +
			buffer1[i + 1] +
			buffer1[i - 320] +
			buffer1[i + 320]) / 2) - buffer2[i]
			
		buffer2[i] -= (buffer2[i] / (2 ** 5))
		
	texture = ImageTexture.create_from_image(buffer_to_image(buffer2))
