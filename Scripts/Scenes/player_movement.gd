extends Sprite2D

var playerpos = Vector2(-9, -5)
var WALKTILE:TileMapLayer

var agressors

func _ready():
	WALKTILE = get_node("/root/Main/Scene01/Walkable")
	agressors = [get_node("/root/Main/Scene01/Deer")]
	
func _input(event: InputEvent):
	var moved = false
	
	if event.is_action_pressed("up"):
		if WALKTILE.get_cell_source_id(playerpos - Vector2(0, 1)) > -1:
			playerpos -= Vector2(0, 1)
			moved = true
	elif event.is_action_pressed("down"):
		if WALKTILE.get_cell_source_id(playerpos + Vector2(0, 1)) > -1:
			playerpos += Vector2(0, 1)
			moved = true
	elif event.is_action_pressed("left"):
		if WALKTILE.get_cell_source_id(playerpos - Vector2(1, 0)) > -1:
			playerpos -= Vector2(1, 0)
			moved = true
	elif event.is_action_pressed("right"):
		if WALKTILE.get_cell_source_id(playerpos + Vector2(1, 0)) > -1:
			playerpos += Vector2(1, 0)
			moved = true
	if moved:
		position = playerpos * 64
		for agressor in agressors:
			agressor.move(playerpos)
