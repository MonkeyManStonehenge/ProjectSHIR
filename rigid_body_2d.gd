extends RigidBody2D

func _process(delta: float):
	if Input.is_key_pressed(KEY_W):
		linear_velocity.y -= 10
	if Input.is_key_pressed(KEY_S):
		linear_velocity.y += 10
	if Input.is_key_pressed(KEY_A):
		linear_velocity.x -= 10
	if Input.is_key_pressed(KEY_D):
		linear_velocity.x += 10
