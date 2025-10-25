extends StaticBody2D

@onready var player = get_node("/root/game/player")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:
		$AudioStreamPlayer2D.playing = true
		await get_tree().create_timer(0.1).timeout
		queue_free()
