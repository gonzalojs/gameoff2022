extends BaseState

export (float) var move_speed = 75

func input(event: InputEvent) -> int:
	if Input.is_action_just_pressed("jump"):
		return State.Jump
	return State.Null

func physics_process(delta: float) -> int:
	if !player.is_on_floor():
		return State.Fall

	var move = 0
	if Input.is_action_pressed("move_l"):
		move = -1
		player.sprite.flip_h = true
	elif Input.is_action_pressed("move_r"):
		move = 1
		player.sprite.flip_h = false

	player.velocity.y += player.gravity
	player.velocity.x = move * move_speed
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)

	if move == 0:
		return State.Idle

	return State.Null
