extends Area2D

@export var collection_duration := 0.4
@export var rise_height := 16.0

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		collect_animation()
		SaveAndLoad.save_checkpoint()

func collect_animation() -> void:
	var tween = create_tween()
	tween.set_parallel(true)

	tween.tween_property($AnimatedSprite2D, "modulate:a", 0.0, collection_duration)
	tween.tween_property(self, "position:y", position.y - rise_height, collection_duration)
	tween.tween_property($AnimatedSprite2D, "scale", Vector2(0.7, 0.7), collection_duration)

	tween.chain().tween_callback(queue_free)