extends Control

func _ready() -> void:
	$VBoxContainer/Label.text = "Score: " + str(PumpkinCount.pumpkin_count)

func _input(_event):
	if Input.is_key_pressed(KEY_R):
		get_tree().change_scene_to_file("res://scenes/game.tscn")
	if Input.is_key_pressed(KEY_Q):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
