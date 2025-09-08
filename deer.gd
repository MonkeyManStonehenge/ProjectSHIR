extends Sprite2D

var pos = Vector2(0, 2)
var WALKTILE:TileMapLayer

func _ready():
	position = pos * 64
	WALKTILE = get_parent().get_node("Walkable")
	
	
func move(playerpos:Vector2, chunk:Vector2):
	
	var destination = playerpos + chunk*Vector2(18, 10)
	
	if pos.x != destination.x and WALKTILE.get_cell_source_id(pos + Vector2(sign(destination.x-pos.x), 0)) > -1:
		pos.x += sign(destination.x-pos.x)
	elif WALKTILE.get_cell_source_id(pos + Vector2(0, sign(destination.y-pos.y))) > -1:
		pos.y += sign(destination.y-pos.y)
		
	position = pos * 64
	
	if pos == destination:
		get_node("/root/Main").message(null, "load", get_node("/root/Main/Cards"))
		await get_node("/root/Main/Cards").start(texture);
		get_node("/root/Main").message(null, "unload", get_parent().get_parent())
