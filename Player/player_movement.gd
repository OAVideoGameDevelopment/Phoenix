class_name PlayerMovement
extends State

@export var actor: Player
@export var animator: AnimatedSprite2D
@export var animation: AnimationPlayer
@export var movementAbility : AbilityLogic

signal default
signal ability

var speedMultiplier : float = 1

func _ready() -> void:
	set_physics_process(false)
	set_process(false)

func _enter_state() -> void:
	set_physics_process(true)
	set_process(true)

func _exit_state() -> void:
	set_process(false)
	set_physics_process(false)

func _physics_process(delta: float) -> void:
	var input_axis_x := Input.get_axis("move_left", "move_right")
	var input_axis_y := Input.get_axis("move_up", "move_down")
	handle_sprint(delta)
	handle_acceleration_x(input_axis_x,delta) 
	handle_acceleration_y(input_axis_y,delta)
	handle_friction_x(input_axis_x,delta)
	handle_friction_y(input_axis_y,delta)
	# Cases
	if (input_axis_x == 0 and input_axis_y == 0): default.emit()

func _process(_delta: float) -> void:
	update_animation()

func handle_acceleration_x(input_axis: float, delta: float) -> void:
	if (input_axis != 0):
		actor.velocity.x = move_toward(actor.velocity.x, input_axis * actor.character_data.speed * speedMultiplier, actor.character_data.acceleration * delta)

func handle_acceleration_y(input_axis: float, delta: float) -> void:
	if (input_axis != 0):
		actor.velocity.y = move_toward(actor.velocity.y, input_axis * actor.character_data.speed * speedMultiplier, actor.character_data.acceleration * delta)

func handle_friction_x(input_axis: float, delta: float) -> void:
	if (input_axis == 0):
		actor.velocity.x = move_toward(actor.velocity.x, 0, actor.character_data.friction * delta)

func handle_friction_y(input_axis: float, delta: float) -> void:
	if (input_axis == 0):
		actor.velocity.y = move_toward(actor.velocity.y, 0, actor.character_data.friction * delta)

func handle_sprint(delta : float):
	if (Input.is_action_just_pressed("sprint")):
		movementAbility.use(actor)
		
	if (Input.is_action_pressed("sprint")):
		speedMultiplier = 1.3
		movementAbility.while_use(actor, delta)
	else:
		speedMultiplier = 1
		
	if (Input.is_action_just_released("sprint")):
		speedMultiplier = 1
		movementAbility.stop_use(actor)
	
func update_animation() -> void:
	animator.play("walk")
