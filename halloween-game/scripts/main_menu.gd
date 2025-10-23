extends Control

func _ready() -> void:
	$VBoxContainer/Label2.text = "High score: " + str(PumpkinCount.pumpkin_count)

func _input(_event):
	if Input.is_key_pressed(KEY_E):
		get_tree().change_scene_to_file("res://scenes/game.tscn")
	if Input.is_key_pressed(KEY_Q):
		get_tree().quit()
