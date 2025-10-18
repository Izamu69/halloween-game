extends Control

func _input(_event):
	if Input.is_key_pressed(KEY_X):
		get_tree().change_scene_to_file("res://scenes/game.tscn")
