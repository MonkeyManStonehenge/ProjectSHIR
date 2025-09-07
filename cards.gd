extends Control

func _ready():
	visible = false
	
func start(enemy:Texture2D):
	get_child(0).texture = enemy
