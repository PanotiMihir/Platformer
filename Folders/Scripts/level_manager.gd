extends Node

func load_level(level_number: int) -> void:
	var level_to_load := level_number

	if not Global.levels.has(level_number):
		level_to_load = 0

	var level_data: Dictionary = Global.levels[level_to_load]
	var path: String = level_data["path"]
	var t: float = level_data["transition_time"]

	Global.running = false

	await Transaction.fade_in(t)
	get_tree().change_scene_to_file(path)
	await get_tree().process_frame

	Global.scene = level_to_load

	await Transaction.fade_out(t)
	Global.running = true

func reload_current_level() -> void:
	load_level(Global.scene)


func load_fallback_level() -> void:
	load_level(0)