extends Node2D

var selected = false
var rest_point
var rest_nodes =[]
var board_position
var board_position_id
var where_rested_id
var where_rested_tile
var move = load("res://scripts/move.gd")

func _ready():
	rest_nodes = get_tree().get_nodes_in_group("zone")

func _process(delta):
	if selected:
		follow_mouse(delta)
	else:
		rest(delta)
		
func set_where_rested_tile(tile):
	where_rested_tile = tile

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
					if(child.get_parent().is_available()):
						var distance =  global_position.distance_to(child.global_position)
						if distance < shortest_distance:
							set_rest(child.global_position)
							board_position_id = child.get_parent().get_id()
							board_position = child.get_parent()
							shortest_distance = distance 
				if(board_position.is_available() == false):
					print("NON E' DISPONIBILE")
					set_rest(where_rested_tile.get_node("drop_zone").global_position)
					board_position = where_rested_tile
				else:
					set_rest(board_position.get_node("drop_zone").global_position)
					board_position.set_available(false)
					where_rested_tile.set_available(true)
					var new_move = move.new(where_rested_id, board_position)
					var temp_log = get_parent().move_log
					temp_log.append(new_move)
		pass
					
			

func set_rest(rest_selected):
	rest_point = rest_selected
	
