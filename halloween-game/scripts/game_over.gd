extends Control

func _ready() -> void:
	$VBoxContainer/Label.text = "Score: " + str(PumpkinCount.pumpkin_count)
	if PumpkinCount.pumpkin_count > HighScore.high_score:
		HighScore.high_score = PumpkinCount.pumpkin_count
		HighScore.save_data()

func _process(_delta):
	$ghost.position.y = 92 + sin(Time.get_ticks_msec() / 300.0) * 2
	$ghost2.position.y = 133 + sin(Time.get_ticks_msec() / 300.0) * 2

func _input(_event):
	if Input.is_key_pressed(KEY_R):
		SceneChanger.change_scene_with_fade(
			"res://scenes/game.tscn",
			"res://assets/music/DavidKBD - Halloween 2024 Pack - Whimsical Witches.ogg"
		)
	if Input.is_key_pressed(KEY_Q):
		SceneChanger.change_scene_with_fade(
			"res://scenes/main_menu.tscn",
			"res://assets/music/DavidKBD - Spooky Pack - Spooky Playtime-08 - Whispers of Darkness.ogg"
		)
