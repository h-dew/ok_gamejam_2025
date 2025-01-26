extends Node2D

var build_mode = false
var build_valid = false
var build_location
var build_type

func _ready():
	print(get_tree().get_nodes_in_group("tower_buttons"))
	for i in get_tree().get_nodes_in_group("tower_buttons"):
		i.pressed.connect(self.initiate_build_mode.bind(i.get_name()))
		
	
func _process(delta):
	if build_mode:
		update_tower_preview()
	
func _input(event):
	if event.is_action_released("td_cancel") and build_mode == true:
		cancel_build_mode()
	if event.is_action_released("td_accept") and build_mode == true:
		verify_and_build()
		cancel_build_mode()
	
func initiate_build_mode(tower_type):
	if build_mode:
		cancel_build_mode()
	build_type = tower_type + "_t1"
	build_mode = true
	get_node("UI").set_tower_preview(build_type, get_global_mouse_position())
	
func update_tower_preview():
	var mouse_position = get_global_mouse_position()
	
	# If not touching other tower:
	get_node("UI").update_tower_preview(mouse_position, "00ff003c")
	build_valid = true
	build_location = mouse_position
	

func cancel_build_mode():
	build_mode = false
	build_valid = false
	get_node("UI/TowerPreview").free()

func verify_and_build():
	if build_valid:
		# Verify enough cash
		var new_tower = load("res://game_modes/tower_defense/towers/" + build_type + ".tscn").instantiate()
		new_tower.position = build_location
		get_node("Map/Towers").add_child(new_tower, true)
		# Deduct cash
		# Update cash label
