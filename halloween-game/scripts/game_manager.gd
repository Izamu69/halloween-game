extends Node2D

@export var pumpkin_scene: PackedScene
@export var ghost_scene: PackedScene
@export var top_right_scene: PackedScene
@export var middle_left_scene: PackedScene
@export var middle_right_scene: PackedScene
@export var bottom_right_scene: PackedScene
@export var top_left_scene: PackedScene
@export var bottom_left_scene: PackedScene
var pumpkin_spawn_points
var ghost_spawn_points

func _ready() -> void:
	spawn_top_right()
	spawn_top_left()
	spawn_middle_left()
	spawn_middle_right()
	spawn_bottom_right()
	spawn_bottom_left()
	pumpkin_spawn_points = get_tree().get_nodes_in_group("pumpkin_spawns")
	ghost_spawn_points = get_tree().get_nodes_in_group("ghost_spawns")
	spawn_pumpkin()
	spawn_ghost()
	spawn_ghost()

func _process(_delta: float) -> void:
	if !get_node(".").has_node("pumpkin"):
		spawn_pumpkin()

var last_pumpkin_position = null
func spawn_pumpkin() -> void:
	if pumpkin_spawn_points.is_empty():
		return
	
	var available_spawns = pumpkin_spawn_points.duplicate()
	if last_pumpkin_position and available_spawns.size() > 1:
		available_spawns.erase(last_pumpkin_position)

	var spawn = available_spawns[randi() % available_spawns.size()]
	last_pumpkin_position = spawn
	
	var pumpkin = pumpkin_scene.instantiate()
	pumpkin.position = spawn.global_position
	add_child(pumpkin)

var last_ghost_position
func spawn_ghost() -> void:
	if ghost_spawn_points.is_empty():
		return
	
	var available_spawns = ghost_spawn_points.duplicate()
	if last_ghost_position and available_spawns.size() > 1:
		available_spawns.erase(last_ghost_position)

	var spawn = available_spawns[randi() % available_spawns.size()]
	last_ghost_position = spawn
	
	var ghost = ghost_scene.instantiate()
	ghost.position = spawn.global_position
	add_child(ghost)

func spawn_top_right() -> void:
	var top_right = top_right_scene.instantiate()
	add_child(top_right)
	
func spawn_top_left() -> void:
	var top_left = top_left_scene.instantiate()
	add_child(top_left)

func spawn_middle_left() -> void:
	var middle_left = middle_left_scene.instantiate()
	add_child(middle_left)

func spawn_middle_right() -> void:
	var middle_right = middle_right_scene.instantiate()
	add_child(middle_right)

func spawn_bottom_right() -> void:
	var bottom_right = bottom_right_scene.instantiate()
	add_child(bottom_right)

func spawn_bottom_left() -> void:
	var bottom_left = bottom_left_scene.instantiate()
	add_child(bottom_left)
