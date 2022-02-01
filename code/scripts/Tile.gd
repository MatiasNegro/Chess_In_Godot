extends Node2D
var id_tile
var available: bool = true
var occupied_by: Object
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func set_id(x, y):
	id_tile = x*10 + y
	
func get_id():
	return id_tile
	
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.hide()

func set_available(available):
	self.available = available

func is_available():
	return available

func _on_Area2D_mouse_entered():
	$Sprite.show() # Replace with function body.
	pass

func _on_Area2D_mouse_exited():
	$Sprite.hide() # Replace with function body.
	pass

func set_position(pos):
	self.position = pos






func _on_Area2D_body_entered(body):
	occupied_by = body
	set_available(false)
	print("ENTRATO")
	
func _on_Area2D_body_exited(body):
	occupied_by = null
	set_available(true)
