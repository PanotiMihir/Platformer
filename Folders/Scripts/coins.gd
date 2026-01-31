extends Area2D

var was_running = false

@export var coin_pos := Vector2()
@export var collection_duration: float = 0.5
@export var rise_height: float = 30.0

func _ready() -> void:
	position = coin_pos

	if Global.collected.has(_get_key()):
		queue_free()
		return

	$AnimatedSprite2D.play("default")

func _on_body_entered(body: Node2D) -> void:
	if body.name != "Player":
		return

	Global.collected[_get_key()] = true
	Global.coins += 1

	$CollisionShape2D.set_deferred("disabled", true)
	collect_animation()

func collect_animation() -> void:
	var tween = create_tween()
	tween.set_parallel(true)

	tween.tween_property($AnimatedSprite2D, "modulate:a", 0.0, collection_duration)
	tween.tween_property(self, "position:y", position.y - rise_height, collection_duration)
	tween.tween_property($AnimatedSprite2D, "scale", Vector2(0.7, 0.7), collection_duration)

	tween.chain().tween_callback(queue_free)

func _get_key() -> String:
	return "%s::%s" % [
		get_tree().current_scene.scene_file_path,
		get_path()
	]

func _process(_delta):
	if Global.running == was_running:
		return

	was_running = Global.running

	if Global.running:
		$AnimatedSprite2D.play("default")
	else:
		$AnimatedSprite2D.pause()