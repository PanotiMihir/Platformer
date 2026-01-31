extends CharacterBody2D

@export var MAX_SPEED = 300.0
@export var JUMP_VELOCITY = 250.0
@export var input_delay = 1.0
@export var acceleration = 1400.0
@export var friction = 1400.0
@export var terminal_velocity = 500.0  # Max falling speed
@export var start_pos = Vector2()

func _ready() -> void:
	add_to_group("player")
	position = start_pos
	Global.coins = 0
	Global.health = 100
	Global.enemies_defeated = 0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		# Clamp falling speed to terminal velocity
		velocity.y = min(velocity.y, terminal_velocity)

	if Global.running:
		handle_input(delta)
	else:
		# Apply friction when not accepting input
		velocity.x = move_toward(velocity.x, 0, friction * delta)

	move_and_slide()

func handle_input(delta: float) -> void:
	if Input.is_action_just_pressed("Jump!") and is_on_floor():
		velocity.y = -JUMP_VELOCITY

	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * MAX_SPEED, acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)