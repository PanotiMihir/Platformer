extends Node

func save_checkpoint() -> void:
	Global.checkpoint = {
		"scene": Global.scene,
		"loop_levels": Global.loop_levels,
		"running": Global.running,

		"coins": Global.coins,
		"health": Global.health,
		"enemies_defeated": Global.enemies_defeated,

		"collected": Global.collected.duplicate(true)
	}

func save_default() -> void:
	Global.checkpoint = {
		"scene": 1,
		"loop_levels": 0,
		"running": false,

		"coins": 0,
		"health": 0,
		"enemies_defeated": 0,

		"collected": {}
	}

func load_checkpoint() -> void:
	if Global.checkpoint.is_empty():
		return

	Global.scene = Global.checkpoint.get("scene", 1)
	Global.loop_levels = Global.checkpoint.get("loop_levels", 0)
	Global.running = Global.checkpoint.get("running", false)

	Global.coins = Global.checkpoint.get("coins", 0)
	Global.health = Global.checkpoint.get("health", 0)
	Global.enemies_defeated = Global.checkpoint.get("enemies_defeated", 0)
	Global.collected = Global.checkpoint.get("collected", {}).duplicate(true)
