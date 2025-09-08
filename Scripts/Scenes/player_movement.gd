extends Sprite2D

var playerpos = Vector2(-9, -5)
var chunk = Vector2(0, 0)

var agressors

func _ready():
	agressors = [get_node("/root/Main/Scene01/World/Deer")]
	
func _input(event: InputEvent):
	var moved = false
	
	var walklayer = get_node(get_meta("Area"))
	
	if event.is_action_pressed("up"):
		if walklayer.get_cell_source_id(playerpos - Vector2(0, 1) + chunk * Vector2(18, 10)) > -1:
			playerpos -= Vector2(0, 1)
			moved = true
	elif event.is_action_pressed("down"):
		if walklayer.get_cell_source_id(playerpos + Vector2(0, 1) + chunk * Vector2(18, 10)) > -1:
			playerpos += Vector2(0, 1)
			moved = true
	elif event.is_action_pressed("left"):
		if walklayer.get_cell_source_id(playerpos - Vector2(1, 0) + chunk * Vector2(18, 10)) > -1:
			playerpos -= Vector2(1, 0)
			moved = true
	elif event.is_action_pressed("right"):
		if walklayer.get_cell_source_id(playerpos + Vector2(1, 0) + chunk * Vector2(18, 10)) > -1:
			playerpos += Vector2(1, 0)
			moved = true
	if moved:
		if playerpos.x < -9:
			get_parent().get_node("World").position.x += 1152
			chunk.x -= 1
			playerpos.x = 8
		elif playerpos.x > 8:
			get_parent().get_node("World").position.x -= 1152
			chunk.x += 1
			playerpos.x = -9
			
		if playerpos.y < -5:
			get_parent().get_node("World").position.y += 640
			chunk.y -= 1
			playerpos.y = 4
		elif playerpos.y > 4:
			get_parent().get_node("World").position.y -= 640
			chunk.y += 1
			playerpos.y = -5
			
		position = (playerpos * 64)
		for agressor in agressors:
			agressor.move(playerpos, chunk)
