extends Control

func _ready():
	visible = false
	
func start(enemy:Texture2D):
	get_child(0).texture = enemy

func _input(event: InputEvent):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			get_node("/root/Main").message(null, "load", get_node("/root/Main/Menu"))
			
			await get_node("/root/Main/Menu").activeScene(self)
			get_node("/root/Main").message(null, "pause", self)
