extends CharacterBody2D

@export var MAX_SPEED = 300.0
@export var JUMP_VELOCITY = 250.0
@export var input_delay = 1.0
@export var acceleration = 1400.0
@export var friction = 1400.0

var can_accept_input = false

func _ready() -> void:
	await get_tree().create_timer(input_delay).timeout
	can_accept_input = true

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if can_accept_input:
		handle_input(delta)

	move_and_slide()

func handle_input(delta: float) -> void:
	if Input.is_action_just_pressed("Jump!") and is_on_floor():
		velocity.y = -JUMP_VELOCITY

	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * MAX_SPEED, acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)