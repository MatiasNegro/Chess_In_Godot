extends Area2D
class_name Tile 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.hide()

func _on_Tile_mouse_entered():
	
	$Sprite.show()
	


func _on_Tile_mouse_exited():
	$Sprite.hide()
	

func set_position(new_position: Vector2):
	position = new_position


