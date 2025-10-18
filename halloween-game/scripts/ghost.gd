extends CharacterBody2D

@onready var player = get_node("/root/game/player")
@export var afraid = false
@export var speed = 100

func _physics_process(_delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	if afraid:
		speed = 50
	else:
		speed = 100
	velocity = direction * speed
	
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	
	move_and_slide()

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		var tree = get_tree()
		if tree:
			call_deferred("_restart_scene")
		
func _restart_scene():
	get_tree().reload_current_scene()
