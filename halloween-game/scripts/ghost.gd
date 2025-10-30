extends CharacterBody2D

@onready var player = get_node("/root/game/player")
@onready var game_manager = get_node("/root/game")
@export var afraid = false
@export var speed = 50
var game_over = false

func _physics_process(_delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	if afraid:
		speed = 25
	else:
		speed = 50
	velocity = direction * speed
	
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	
	move_and_slide()

func _on_area_2d_body_entered(body):
	if body.is_in_group("player") and not game_over:
		game_over = true
		player.process_mode = Node.PROCESS_MODE_DISABLED
		SceneChanger.change_scene_with_fade(
			"res://scenes/game_over.tscn",
			"res://assets/music/DavidKBD - Halloween 2024 Pack - Foggy Graveyard.ogg"
		)
