extends Node2D

@export var pumpkin_scene: PackedScene

func _ready() -> void:
	var pumpkin = pumpkin_scene.instantiate()
	
	var pumpkin_spawn_location = $Path2D/PathFollow2D
	pumpkin_spawn_location.progress_ratio = randf()
	
	pumpkin.position = pumpkin_spawn_location.position
	
	add_child(pumpkin)
