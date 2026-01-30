extends CanvasLayer

@onready var fade_rect: ColorRect = $ColorRect

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS  # ADD THIS LINE

func fade_out(duration := 0.5):
	fade_rect.visible = true
	fade_rect.modulate.a = 1.0
	
	var tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 0.0, duration)
	await tween.finished  # ADD THIS

func fade_in(duration := 0.5):
	fade_rect.visible = true
	fade_rect.modulate.a = 0.0
	
	var tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 1.0, duration)
	await tween.finished  # ADD THIS