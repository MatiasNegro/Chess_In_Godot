extends "res://scripts/Piece.gd"

func init(rest_zone):
	set_rest(rest_zone)
	
func set_where_rested_id(tile):
	where_rested_id = tile.get_id()


	
