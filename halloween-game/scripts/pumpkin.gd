extends StaticBody2D

@onready var player = get_node("/root/game/player")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:
		queue_free()
