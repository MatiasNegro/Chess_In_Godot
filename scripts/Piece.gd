extends Node2D

var selected = false
var rest_point
var rest_nodes =[]


func _ready():
	rest_nodes = get_tree().get_nodes_in_group("zone")



func _process(delta):
	if selected:
		follow_mouse(delta)
	else:
		rest(delta)
		

func follow_mouse(delta):
	global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
	
func rest(delta):
	global_position = lerp(global_position, rest_point, 10 * delta)



func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			selected = true
		else:
			if event.button_index == BUTTON_LEFT and not event.pressed:
				selected = false
				var shortest_distance = 512
				for child in rest_nodes:
					var distance =  global_position.distance_to(child.global_position)
					if distance < shortest_distance:
						rest_point = child.global_position
						shortest_distance = distance 

func set_rest(rest_selected):
	rest_point = rest_selected
