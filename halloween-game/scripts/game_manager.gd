extends Node2D

@export var pumpkin_scene: PackedScene
@export var ghost_scene: PackedScene
@export var top_right_scene: PackedScene
var spawn_points

func _ready() -> void:
	spawn_top_right()
	spawn_points = get_tree().get_nodes_in_group("pumpkin_spawns")
	print(spawn_points)
	spawn_pumpkin()
	spawn_ghost()
	spawn_ghost()

func _process(_delta: float) -> void:
	if !get_node(".").has_node("pumpkin"):
		spawn_pumpkin()

var last_pumpkin_position = null
func spawn_pumpkin() -> void:
	if spawn_points.is_empty():
		return
	
	var available_spawns = spawn_points.duplicate()
	if last_pumpkin_position and available_spawns.size() > 1:
		available_spawns.erase(last_pumpkin_position)

	var spawn = available_spawns[randi() % available_spawns.size()]
	last_pumpkin_position = spawn
	
	var pumpkin = pumpkin_scene.instantiate()
	pumpkin.position = spawn.global_position
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
