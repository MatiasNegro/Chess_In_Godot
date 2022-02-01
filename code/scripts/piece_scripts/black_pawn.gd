extends "res://scripts/Piece.gd"



func init(rest_zone):
	set_rest(rest_zone)
	
func set_where_rested_id(tile):
	where_rested_id = tile.get_id()

	



func _on_RigidBody2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	
	pass 
