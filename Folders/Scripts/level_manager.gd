extends Node

var loop_levels: bool = false

var levels := [
	{"path": "res://Folders/Scenes/Levels/level_1.tscn", "transition_time": 1.0},
	{"path": "res://Folders/Scenes/Levels/level_2.tscn", "transition_time": 1.5}
]

var current_level := 0

func load_level(index: int) -> void:
	current_level = index
	var level_data = levels[current_level]
	var t = level_data.transition_time

	get_tree().paused = true
	await Transaction.fade_in(t)

	get_tree().change_scene_to_file(level_data.path)
	await get_tree().process_frame

	await Transaction.fade_out(t)
	get_tree().paused = false

func next_level() -> void:
	current_level += 1

	if current_level >= levels.size():
		if loop_levels:
			current_level = 0
		else:
			print("All levels finished")
			return

	load_level(current_level)