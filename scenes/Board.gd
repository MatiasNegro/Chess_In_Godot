extends Node2D
class_name Board
var SIZE = 8
var tiles = []
var tile_source = preload("res://scenes/Tile.tscn")
var new_tile 
var first_tile
var init_pos = {
	pos_x = 110,
	pos_y = 115,
}

var to_incr = {
	x = 57,
	y = 57,
}
var incr_x = 0
var incr_y = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#$Sprite.hide()
	generate_tiles()
	print(self.get_children())
#	for i in range(SIZE * SIZE):
#		tiles[i].show()
		
	
func generate_tiles():
	for i in range(1, (SIZE * SIZE) + 8 ):
		if i % 9 != 0:
			new_tile = tile_source.instance()
			new_tile.set_position(Vector2(init_pos.pos_x + (incr_x * to_incr.x), init_pos.pos_y + (incr_y * to_incr.y)))
			incr_x +=1
		else:
			incr_x = 0
			incr_y += 1
		self.add_child(new_tile)
		#tiles.append(new_tile)


