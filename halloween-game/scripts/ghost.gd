extends CharacterBody2D

@onready var player = get_node("/root/game/player")
const SPEED = 100

func _physics_process(_delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * SPEED
	move_and_slide()

func run_away():
	print("im running away")
