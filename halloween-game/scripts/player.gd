extends CharacterBody2D

const SPEED = 500

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("ghosts"):
		body.afraid = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("ghosts"):
		body.afraid = false
