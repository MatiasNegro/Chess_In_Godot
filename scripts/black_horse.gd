extends "res://scripts/Piece.gd"



func _ready():
	set_rest(rest_nodes[0].global_position)
	where_rested_id = rest_nodes[0].get_parent().get_id()

