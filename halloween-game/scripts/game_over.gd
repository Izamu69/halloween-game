extends Control

func _ready() -> void:
	$Label.text = "Score: " + str(PumpkinCount.pumpkin_count)

func _input(_event):
	if Input.is_key_pressed(KEY_X):
		get_tree().change_scene_to_file("res://scenes/game.tscn")
