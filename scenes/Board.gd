extends Node2D
class_name Board
var SIZE = 8
var tiles = []
var new_tile 
var first_tile
var init_pos = {
	pos_x = 115,
	pos_y = 119,
}

var incr_pos = {
	x = 57,
	y = 56,
}
var incr_x = 1
var incr_y = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.show()
	generate_tiles()
	for i in range(SIZE * SIZE):
		tiles[i].show()
		
	
func generate_tiles():
	first_tile = load("res://scenes/Tile.tscn").instance()
	first_tile.set_position(Vector2(init_pos.pos_x , init_pos.pos_y))
	add_child(first_tile)
	tiles.append(first_tile)
	for i in range(SIZE * SIZE):
			new_tile = load("res://scenes/Tile.tscn").instance()
			if i % 8 != 0:
				new_tile.set_position(Vector2(init_pos.pos_x + (incr_x * incr_pos.x), init_pos.pos_y))
				incr_x +=1
			else:
				new_tile.set_position(Vector2(init_pos.pos_x , init_pos.pos_y + (incr_y * incr_pos.y)))
				incr_x = 1
				incr_y += 1
			add_child(new_tile)
			tiles.append(new_tile)
			
			



