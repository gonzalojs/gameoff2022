extends BaseState

export (float) var move_speed = 75

func physics_process(delta: float) -> int:
	var move = 0
	if Input.is_action_pressed("move_l"):
		move = -1
		player.sprite.flip_h = true
	elif Input.is_action_pressed("move_r"):
		move = 1
		player.sprite.flip_h = false

	player.velocity.x = move * move_speed
	player.velocity.y += player.gravity
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)

	if player.is_on_floor():
		if move != 0:
			return State.Walk
		else:
			return State.Idle
	return State.Null
