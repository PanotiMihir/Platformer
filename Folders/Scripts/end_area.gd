extends Area2D

@export var linkedscene = 0

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		LevelManager.load_level(linkedscene)