class_name Player
extends CharacterBody2D

@export var character_data : PlayerCharacterData

#signal death(clone: Node2D)

var example : bool = true

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var player_collision: CollisionShape2D = $WorldCollision
@onready var camera: Camera2D = $Camera2D

@onready var detection: Node2D = $Detection

@onready var fsm: FiniteStateMachine = $FiniteStateMachine
@onready var player_movement: PlayerMovement = $FiniteStateMachine/PlayerMovement
@onready var player_default: PlayerDefault = $FiniteStateMachine/PlayerDefault

func _ready() -> void:
	# FSM Signals
	default_signals()
	movement_signals()

func movement_signals() -> void:
	player_movement.default.connect(fsm.change_state.bind(player_default))

func default_signals() -> void:
	player_default.walk.connect(fsm.change_state.bind(player_movement))

func _physics_process(_delta: float) -> void:
	move_and_slide()

func _process(_delta: float) -> void:
	var input_axis := Input.get_axis("move_left", "move_right")
	dir_flip(input_axis)

func dir_flip(input_axis: float) -> void:
	if (input_axis != 0):
		animated_sprite.flip_h = input_axis <= 0
		# These will be used later
		detection.scale.x *= -1
		player_collision.position.x *= -1
