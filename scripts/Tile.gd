extends Node2D
var id_tile
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func set_id(id):
	id_tile = id
	
func get_id():
	return id_tile
	
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_mouse_entered():
	$Sprite.show() # Replace with function body.
	pass

func _on_Area2D_mouse_exited():
	$Sprite.hide() # Replace with function body.
	pass

func set_position(pos):
	self.position = pos
