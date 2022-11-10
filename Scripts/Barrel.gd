extends KinematicBody2D

var gravity = 6
var velocity = Vector2.ZERO
var push_left = false
var push_right = false


func _physics_process(delta: float) -> void:
	if is_on_floor():
		velocity.y = 0
	else:
		velocity.y += gravity

	if push_left:
		velocity.x = 20

	if push_right:
		velocity.x = -20

	if not push_left and not push_right:
		velocity.x = 0


	velocity = move_and_slide(velocity, Vector2.UP)



func _on_Area2D_body_entered(body:Node) -> void:
	if body.name == "Player":
		push_left = true


func _on_Area2D_body_exited(body:Node) -> void:
	if body.name == "Player":
		push_left = false



func _on_right_area_body_exited(body:Node) -> void:
	if body.name == "Player":
		push_right = false

func _on_right_area_body_entered(body:Node) -> void:
	if body.name == "Player":
		push_right = true
