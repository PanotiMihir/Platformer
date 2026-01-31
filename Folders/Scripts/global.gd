extends Node

# Setup
var scene
var loop_levels: bool = true
var running: bool

# Player
var coins: int
var health: float
var enemies_defeated: int

# Persistence
var collected := {}

#CheckPoints Save
var checkpoint := {}