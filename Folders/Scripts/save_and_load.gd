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


func load_checkpoint() -> void:
	if Global.checkpoint.is_empty():
		return

	Global.scene = Global.checkpoint["scene"]
	Global.loop_levels = Global.checkpoint["loop_levels"]
	Global.running = Global.checkpoint["running"]

	Global.coins = Global.checkpoint["coins"]
	Global.health = Global.checkpoint["health"]
	Global.enemies_defeated = Global.checkpoint["enemies_defeated"]
	Global.collected = Global.checkpoint["collected"].duplicate(true)
