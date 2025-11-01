extends CharacterBody2D

@onready var player = get_node_or_null("/root/game/player")
@export var afraid = false
@export var base_speed = 50
var speed_multiplier := 1.0
var game_over = false

func _physics_process(_delta: float) -> void:
	if not player:
		return
	
	var direction = global_position.direction_to(player.global_position)
	
	var current_speed = base_speed * speed_multiplier
	if afraid:
		current_speed *= 0.5

	velocity = direction * current_speed
	
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
