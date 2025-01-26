extends Node2D

var type
var bubble_array = []
var built = false
var bubble
var ready_fire = true

var wavetex
var pos = Vector2(0,0)
var rate
var damage

func _ready() -> void:
	if built:
		self.get_node("Range/CollisionShape2D").get_shape().radius = 0.5 * GameData.tower_data[type]["range"]

# Checks for bubbles every physics frame
func _physics_process(delta: float) -> void:
	if bubble_array.size() != 0 and built:
		select_bubble()
	else:
		bubble = null
		
# Picks bubble to target, REPURPOSE - WAS USED WITH FIRERATE THING
func select_bubble():
	var bubble_progress_array = []
	for i in bubble_array:
		bubble_progress_array.append(i.progress)
	var max_progress = bubble_progress_array.max()
	var bubble_index = bubble_progress_array.find(max_progress)
	bubble = bubble_array[bubble_index]


func _on_range_body_entered(body: Node2D) -> void:
	bubble_array.append(body.get_parent())


func _on_range_body_exited(body: Node2D) -> void:
	bubble_array.erase(body.get_parent())
