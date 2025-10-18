extends CharacterBody2D

@export var speed = 500

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
		
	if velocity == Vector2(0, 0):
		$AnimatedSprite2D.animation = "idle_side"
	else:
		$AnimatedSprite2D.animation = "walk_side"
	
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("ghosts"):
		body.afraid = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("ghosts"):
		body.afraid = false
