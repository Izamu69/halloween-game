extends Node

@onready var player := AudioStreamPlayer.new()
var fade_time := 0.5  # seconds for fade
var tween: Tween

func _ready():
	add_child(player)
	player.autoplay = false
	player.volume_db = -80  # start silent
	player.bus = "Music"  # optional, if you have a separate bus
	player.connect("finished", Callable(self, "_on_music_finished"))

func play_music(path: String):
	var new_stream = load(path)
	if player.stream == new_stream:
		return  # already playing this track

	if tween:
		tween.kill()
	
	tween = create_tween()
	
	# fade out current music
	tween.tween_property(player, "volume_db", -80, fade_time)
	
	tween.tween_callback(func ():
		player.stream = new_stream
		player.play()
	)
	
	# fade in new music
	tween.tween_property(player, "volume_db", -10, fade_time)

func _on_music_finished():
	# Replay the current track when it ends
	player.play()
