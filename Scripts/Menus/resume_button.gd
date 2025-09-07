extends Area2D

var mouseover = false

func _mouse_enter():
	mouseover = true
	
func _mouse_exit(): 
	mouseover = false
	
func _input(event: InputEvent):
	if event is InputEventMouseButton and mouseover:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			get_node("/root/Main").message(get_parent(), "swap", get_parent().scene)
