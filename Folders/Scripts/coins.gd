extends Area2D

@export var coin_pos = Vector2()

func _ready() -> void:
    position = coin_pos
    $AnimatedSprite2D.play("default")

func _on_body_entered(body: Node2D) -> void:
    if body.name == "Player":
        Global.coins += 1
        queue_free()
