extends Node

# Static level config (never mutated at runtime)
var levels := {
	0: { # fallback / invalid level
		"path": "res://Folders/Scenes/Levels/level_0.tscn",
		"transition_time": 0.5
	},
	1: {
		"path": "res://Folders/Scenes/Levels/level_1.tscn",
		"transition_time": 1.0
	},
	2: {
		"path": "res://Folders/Scenes/Levels/level_2.tscn",
		"transition_time": 1.5
	}
}

# Runtime state
var scene: int = 0
var running: bool
var loop_levels: bool

# Player
var coins: int
var health: float
var enemies_defeated: int

# Persistence
var collected := {}

#CheckPoints Save
var checkpoint := {}