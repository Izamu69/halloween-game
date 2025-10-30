extends Control

func _ready() -> void:
	MusicManager.play_music("res://assets/music/DavidKBD - Spooky Pack - Spooky Playtime-08 - Whispers of Darkness.ogg")
	Transition.fade_out()
	$VBoxContainer/Label2.text = "High score: " + str(HighScore.high_score)

func _input(_event):
	if Input.is_key_pressed(KEY_E):
		SceneChanger.change_scene_with_fade(
			"res://scenes/game.tscn",
			"res://assets/music/DavidKBD - Halloween 2024 Pack - Whimsical Witches.ogg"
		)
	if Input.is_key_pressed(KEY_Q):
		get_tree().quit()
