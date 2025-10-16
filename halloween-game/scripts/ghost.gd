extends CharacterBody2D

@onready var player = get_node("/root/game/player")
var afraid = false
const SPEED = 100

func _physics_process(_delta: float) -> void:
	var direction
	if afraid:
		direction = -global_position.direction_to(player.global_position)
	else:
		direction = global_position.direction_to(player.global_position)
	velocity = direction * SPEED
	move_and_slide()
