extends Node2D

var SIZE = 8
var tile = load("res://scenes/Tile.tscn")
var bh = load("res://scenes/pieces/black_horse.tscn")
var wh = load("res://scenes/pieces/white_horse.tscn")
var bq = load("res://scenes/pieces/black_queen.tscn")
var wq = load("res://scenes/pieces/white_queen.tscn")
var bk = load("res://scenes/pieces/black_king.tscn")
var wk = load("res://scenes/pieces/white_king.tscn")
var bb = load("res://scenes/pieces/black_bishop.tscn")
var wb = load("res://scenes/pieces/white_bishop.tscn")
var br = load("res://scenes/pieces/black_rook.tscn")
var wr = load("res://scenes/pieces/white_rook.tscn")
var bp = load("res://scenes/pieces/black_pawn.tscn")
var wp = load("res://scenes/pieces/white_pawn.tscn")
#Standard for the array => [pawn, rook, horse, bishop, king, queen]
var white_pieces = [wp, wr, wh, wb, wk, wq] 
var black_pieces = [bp, br, bh, bb, bk, bq] 
var move_log = []

var pos = {
	x = 0,
	y = 0
}

var to_incr_x = 0
var to_incr_y = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_tiles()
	var my_tiles = get_tree().get_nodes_in_group("tile") 
	load_pieces()
	


func set_tiles():
	var new_tile
	for i in range(0, SIZE * SIZE + 1):
		new_tile = tile.instance()
		new_tile.set_id(to_incr_y + 1,to_incr_x + 1)
		new_tile.set_position(Vector2(pos.x + (64 * to_incr_x), pos.y + (64 * to_incr_y)))
		self.add_child(new_tile)
		to_incr_x += 1
		if i%8 == 0:
			if i == 0:
				continue
			to_incr_y += 1
			to_incr_x = 0
			
func load_pieces():
	var tiles = get_tree().get_nodes_in_group("tile")
	var new_piece
	#load of the black pawns
	for tile in tiles:
		if(tile.get_id() / 10 == 2):
			new_piece = black_pieces[0].instance()
			new_piece.init(tile.get_node("drop_zone").global_position)
			new_piece.set_where_rested_id(tile)
			new_piece.set_where_rested_tile(tile)
			add_child(new_piece)
		elif((tile.get_id() -10 == 2 and tile.get_id() / 10 == 1) or (tile.get_id() -10 == 7 and tile.get_id() / 10 == 1)):
			new_piece = black_pieces[2].instance()
			new_piece.init(tile.get_node("drop_zone").global_position)
			new_piece.set_where_rested_id(tile)
			new_piece.set_where_rested_tile(tile)
			add_child(new_piece)
		elif((tile.get_id() -10 == 1 and tile.get_id() / 10 == 1) or (tile.get_id() -10 == 8 and tile.get_id() / 10 == 1)):
			new_piece = black_pieces[1].instance()
			new_piece.init(tile.get_node("drop_zone").global_position)
			new_piece.set_where_rested_id(tile)
			new_piece.set_where_rested_tile(tile)
			add_child(new_piece)
		elif((tile.get_id() - 10 == 3 and tile.get_id() / 10 == 1) or (tile.get_id() -10 == 6 and tile.get_id() / 10 == 1)):
			new_piece = black_pieces[3].instance()
			new_piece.init(tile.get_node("drop_zone").global_position)
			new_piece.set_where_rested_id(tile)
			new_piece.set_where_rested_tile(tile)
			add_child(new_piece)
		elif(tile.get_id() -10 == 4 and tile.get_id() / 10 == 1):
			new_piece = black_pieces[4].instance()
			new_piece.init(tile.get_node("drop_zone").global_position)
			new_piece.set_where_rested_id(tile)
			new_piece.set_where_rested_tile(tile)
			add_child(new_piece)
		elif(tile.get_id() -10 == 5 and tile.get_id() / 10 == 1):
			new_piece = black_pieces[5].instance()
			new_piece.init(tile.get_node("drop_zone").global_position)
			new_piece.set_where_rested_id(tile)
			new_piece.set_where_rested_tile(tile)
			add_child(new_piece)
		elif(tile.get_id() / 10 == 7):
			new_piece = white_pieces[0].instance()
			new_piece.init(tile.get_node("drop_zone").global_position)
			new_piece.set_where_rested_id(tile)
			new_piece.set_where_rested_tile(tile)
			add_child(new_piece)
		elif((tile.get_id() - 80 == 2 and tile.get_id() / 10 == 8) or (tile.get_id() - 80 == 7 and tile.get_id() / 10 == 8)):
			new_piece = white_pieces[2].instance()
			new_piece.init(tile.get_node("drop_zone").global_position)
			new_piece.set_where_rested_id(tile)
			new_piece.set_where_rested_tile(tile)
			add_child(new_piece)
		elif((tile.get_id() - 80 == 1 and tile.get_id() / 10 == 8) or (tile.get_id() - 80 == 8 and tile.get_id() / 10 == 8)):
			new_piece = white_pieces[1].instance()
			new_piece.init(tile.get_node("drop_zone").global_position)
			new_piece.set_where_rested_id(tile)
			new_piece.set_where_rested_tile(tile)
			add_child(new_piece)
		elif((tile.get_id() - 80 == 3 and tile.get_id() / 10 == 8) or (tile.get_id() - 80 == 6 and tile.get_id() / 10 == 8)):
			new_piece = white_pieces[3].instance()
			new_piece.init(tile.get_node("drop_zone").global_position)
			new_piece.set_where_rested_id(tile)
			new_piece.set_where_rested_tile(tile)
			add_child(new_piece)
		elif(tile.get_id() - 80 == 5 and tile.get_id() / 10 == 8):
			new_piece = white_pieces[4].instance()
			new_piece.init(tile.get_node("drop_zone").global_position)
			new_piece.set_where_rested_id(tile)
			new_piece.set_where_rested_tile(tile)
			add_child(new_piece)
		elif(tile.get_id() - 80 == 4 and tile.get_id() / 10 == 8):
			new_piece = white_pieces[5].instance()
			new_piece.init(tile.get_node("drop_zone").global_position)
			new_piece.set_where_rested_id(tile)
			new_piece.set_where_rested_tile(tile)
			add_child(new_piece)
	pass
	
