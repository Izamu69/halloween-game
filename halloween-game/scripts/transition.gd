extends CanvasLayer

@onready var fade_rect = $ColorRect
var tween: Tween

func fade_in(duration := 1.0):
	fade_rect.visible = true
	if tween: tween.kill()
	tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 1.0, duration)

func fade_out(duration := 1.0):
	if tween: tween.kill()
	tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 0.0, duration)
	tween.tween_callback(func(): fade_rect.visible = false)
