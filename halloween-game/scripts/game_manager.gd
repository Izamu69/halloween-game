extends Node2D

@export var pumpkin_scene: PackedScene
@export var ghost_scene: PackedScene
@export var top_right_scene: PackedScene

func _ready() -> void:
	spawn_pumpkin()
	spawn_ghost()
	spawn_ghost()
	spawn_top_right()

func _process(_delta: float) -> void:
	if !get_node(".").has_node("pumpkin"):
		spawn_pumpkin()

func spawn_pumpkin() -> void:
	var pumpkin = pumpkin_scene.instantiate()
	
	var pumpkin_spawn_location = $Path2D/PathFollow2D
	pumpkin_spawn_location.progress_ratio = randf()
	
	pumpkin.position = pumpkin_spawn_location.position
	
	add_child(pumpkin)

func spawn_ghost() -> void:
	var ghost = ghost_scene.instantiate()
	
	var ghost_spawn_location = $Path2D/PathFollow2D
	ghost_spawn_location.progress_ratio = randf()
	
	ghost.position = ghost_spawn_location.position
	
	add_child(ghost)

func spawn_top_right() -> void:
	var top_right = top_right_scene.instantiate()
	add_child(top_right)
