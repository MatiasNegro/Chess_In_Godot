extends Node2D


var board
var Tile = preload("res://scenes/Tile.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	board = get_tales()
	print(board)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func get_tales():
	var temp = []
	for i in self.get_children():
		if i is Tile:
			temp.append(i)

	return temp
