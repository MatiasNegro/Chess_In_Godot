extends Node2D

var SIZE = 8
var tile = load("res://scenes/Tile.tscn")
var piece = load("res://scenes/black_horse.tscn")
var wh = load("res://scenes/white_horse.tscn")
var move_log = []
#onready var move = get_node("Move")

var pos = {
	x = 0,
	y = 0
}

var to_incr_x = 0
var to_incr_y = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_tiles()
	var new_piece = piece.instance()
	add_child(new_piece)
	var new_wh = wh.instance()
	add_child(new_wh)


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
