extends Area2D

@export var coin_pos = Vector2()
@export var collection_duration: float = 0.5  # How long the collection animation takes
@export var rise_height: float = 30.0  # How high the coin rises when collected

func _ready() -> void:
    position = coin_pos
    $AnimatedSprite2D.play("default")

func _on_body_entered(body: Node2D) -> void:
    if body.name == "Player":
        Global.coins += 1
        # Disable collision so player can't collect twice
        $CollisionShape2D.set_deferred("disabled", true)
        # Start collection animation
        collect_animation()

func collect_animation() -> void:
    var tween = create_tween()
    tween.set_parallel(true)
    
    # Fade out over the collection duration
    tween.tween_property($AnimatedSprite2D, "modulate:a", 0.0, collection_duration)
    
    # Rise up by the specified height over the collection duration
    tween.tween_property(self, "position:y", position.y - rise_height, collection_duration)
    
    # Optional: slight scale effect
    tween.tween_property($AnimatedSprite2D, "scale", Vector2(0.7, 0.7), collection_duration)
    
    # Delete after animation completes
    tween.chain().tween_callback(queue_free)