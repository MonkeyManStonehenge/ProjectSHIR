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
		
	position = pos * 64
	
	if pos == playerpos:
		get_node("/root/Main").message(null, "load", get_node("/root/Main/Cards"))
		await get_node("/root/Main/Cards").start(texture);
		get_node("/root/Main").message(null, "unload", get_parent())
