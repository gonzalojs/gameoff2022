extends BaseState

func input(event: InputEvent) -> int:
	if Input.is_action_just_pressed("move_l") or Input.is_action_just_pressed("move_r"):
		return State.Walk
	elif Input.is_action_just_pressed("jump"):
		return State.Jump
	return State.Null

func physics_process(delta: float) -> int:
	if !player.available_jump:
		player.available_jump = true
	player.velocity.y += player.gravity
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)

	if !player.is_on_floor():
		return State.Fall
	return State.Null
