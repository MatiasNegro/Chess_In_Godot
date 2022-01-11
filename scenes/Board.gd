extends Node2D
class_name Board
var SIZE = 8
var tiles = []
var new_tile 
var pos = {
	pos_x = 0,
	pos_y = 0
}
var incremental = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.show()
	generate_tiles()
	for i in range(SIZE * SIZE):
		tiles[i].show()
		
	
func generate_tiles():
	for i in range(SIZE * SIZE):
			new_tile = load("res://scenes/Tile.tscn").instance()
			new_tile.set_position(Vector2(pos.pos_x + incremental, pos.pos_y + incremental))
			incremental += 10
			add_child(new_tile)
			tiles.append(new_tile)
			
			



