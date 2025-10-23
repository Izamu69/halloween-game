extends Node2D

@export var pumpkin_scene: PackedScene
@export var ghost_scene: PackedScene

@export var top_right_scene: PackedScene
@export var top_right_scene2: PackedScene

@export var middle_left_scene: PackedScene
@export var middle_left_scene2: PackedScene

@export var middle_right_scene: PackedScene
@export var middle_right_scene2: PackedScene

@export var bottom_right_scene: PackedScene
@export var bottom_right_scene2: PackedScene

@export var top_left_scene: PackedScene
@export var top_left_scene2: PackedScene

@export var bottom_left_scene: PackedScene
@export var bottom_left_scene2: PackedScene

var pumpkin_spawn_points
var ghost_spawn_points

func _ready() -> void:
	PumpkinCount.pumpkin_count = 0
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
		PumpkinCount.increase_count()
		print(PumpkinCount.pumpkin_count)

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
	var top_right_scenes = [top_right_scene, top_right_scene2]
	var scene = top_right_scenes[randi() % top_right_scenes.size()]
	var top_right = scene.instantiate()
	add_child(top_right)
	
func spawn_top_left() -> void:
	var top_left_scenes = [top_left_scene, top_left_scene2]
	var scene = top_left_scenes[randi() % top_left_scenes.size()]
	var top_left = scene.instantiate()
	add_child(top_left)

func spawn_middle_left() -> void:
	var middle_left_scenes = [middle_left_scene, middle_left_scene2]
	var scene = middle_left_scenes[randi() % middle_left_scenes.size()]
	var middle_left = scene.instantiate()
	add_child(middle_left)

func spawn_middle_right() -> void:
	var middle_right_scenes = [middle_right_scene, middle_right_scene2]
	var scene = middle_right_scenes[randi() % middle_right_scenes.size()]
	var middle_right = scene.instantiate()
	add_child(middle_right)

func spawn_bottom_right() -> void:
	var bottom_right_scenes = [bottom_right_scene, bottom_right_scene2]
	var scene = bottom_right_scenes[randi() % bottom_right_scenes.size()]
	var bottom_right = scene.instantiate()
	add_child(bottom_right)

func spawn_bottom_left() -> void:
	var bottom_left_scenes = [bottom_left_scene, bottom_left_scene2]
	var scene = bottom_left_scenes[randi() % bottom_left_scenes.size()]
	var bottom_left = scene.instantiate()
	add_child(bottom_left)
