extends Node

func _ready() -> void:
	LevelManager.load_level.call_deferred(1)