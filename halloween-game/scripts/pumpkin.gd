extends StaticBody2D

@onready var player = get_node_or_null("/root/game/player")

func _ready() -> void:
	_start_glow_pulse()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:
		$AudioStreamPlayer2D.playing = true
		await get_tree().create_timer(0.1).timeout
		queue_free()

func _start_glow_pulse() -> void:
	if not has_node("GlowSprite"):
		return
	
	var tween := create_tween().set_loops()  # repeat forever
	tween.tween_property($GlowSprite, "modulate:a", 0.25, 1.0)
	tween.tween_property($GlowSprite, "modulate:a", 0.6, 1.0)
