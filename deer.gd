extends Sprite2D

var pos = Vector2(0, 2)
var WALKTILE:TileMapLayer

func _ready():
	position = pos * 64
	WALKTILE = get_node("/root/Main/Scene01/Walkable")
	
	
func move(playerpos:Vector2):
	
	if pos.x != playerpos.x and WALKTILE.get_cell_source_id(pos + Vector2(sign(playerpos.x-pos.x), 0)) > -1:
		pos.x += sign(playerpos.x-pos.x)
	elif WALKTILE.get_cell_source_id(pos + Vector2(0, sign(playerpos.y-pos.y))) > -1:
		pos.y += sign(playerpos.y-pos.y)
		
	if pos == playerpos:
		print("fight")
	position = pos * 64
	
'''
func _input(event: InputEvent):
	if event.is_action_pressed("up"):
		if WALKTILE.get_cell_source_id(pos - Vector2(0, 1)) > -1:
			pos -= Vector2(0, 1)
	elif event.is_action_pressed("down"):
		if WALKTILE.get_cell_source_id(pos + Vector2(0, 1)) > -1:
			pos += Vector2(0, 1)
	elif event.is_action_pressed("left"):
		if WALKTILE.get_cell_source_id(pos - Vector2(1, 0)) > -1:
			pos -= Vector2(1, 0)
	elif event.is_action_pressed("right"):
		if WALKTILE.get_cell_source_id(pos + Vector2(1, 0)) > -1:
			pos += Vector2(1, 0)
	position = pos * 64
'''
