extends Area2D
class_name Tile 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var id
var pos_x = 0
var pos_y = 0

func _init(new_id):
	self.id = new_id
# Called when the node enters the scene tree for the first time.
func _ready():
	#$Sprite.hide()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	pass


func _on_Tile_mouse_entered():
	#$Sprite.show()
	pass


func _on_Tile_mouse_exited():
	#$Sprite.hide()
	pass

func set_position(new_position: Vector2):
	position = new_position
