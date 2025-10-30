extends Node

func change_scene_with_fade(scene_path: String, music_path: String = "", fade_time := 0.5):
	await Transition.fade_in(fade_time)
	if music_path != "":
		MusicManager.play_music(music_path)
	await get_tree().create_timer(fade_time).timeout
	get_tree().change_scene_to_file(scene_path)
	await get_tree().create_timer(0.1).timeout
	Transition.fade_out(fade_time)
