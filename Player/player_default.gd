class_name PlayerDefault
extends State

signal walk

@export var actor: Player
@export var animation: AnimationPlayer
@export var animator: AnimatedSprite2D

func _enter_state() -> void:
	set_physics_process(true)

func _exit_state() -> void:
	set_physics_process(false)

func _ready() -> void:
	set_physics_process(false)

func _physics_process(delta: float) -> void:
	var input_axis_x := Input.get_axis("move_left", "move_right")
	var input_axis_y := Input.get_axis("move_up", "move_down")
	handle_friction_x(input_axis_x,delta)
	handle_friction_y(input_axis_y,delta)
	animator.play("idle")
	
	# Cases
	if (input_axis_x != 0 or input_axis_y != 0): walk.emit()

func handle_friction_x(input_axis: float, delta: float) -> void:
	if (input_axis == 0):
		actor.velocity.x = move_toward(actor.velocity.x, 0, actor.character_data.friction * delta)

func handle_friction_y(input_axis: float, delta: float) -> void:
	if (input_axis == 0):
		actor.velocity.y = move_toward(actor.velocity.y, 0, actor.character_data.friction * delta)
