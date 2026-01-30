extends Node

# Template
"res://Folders/Scenes/Levels/<Insert Level Here>.tscn"

var levels := [
	"res://Folders/Scenes/Levels/level_1.tscn"
]

var current_level := 0

func load_level(index: int):
	current_level = index
	get_tree().change_scene_to_file(levels[current_level])

func next_level():
	current_level += 1
	if current_level < levels.size():
		load_level(current_level)
	else:
		print("All levels finished")