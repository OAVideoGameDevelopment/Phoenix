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
@onready var player_ability : PlayerAbility = $FiniteStateMachine/PlayerAbility

@onready var healthBar = $HealthBar

func _ready() -> void:
	# FSM Signals
	default_signals()
	movement_signals()
	ability_signals()
	
	healthBar.set_health_bar(character_data.HP, maxHealth)

func movement_signals() -> void:
	player_movement.default.connect(fsm.change_state.bind(player_default))
	player_movement.ability.connect(fsm.change_state.bind(player_ability))

func default_signals() -> void:
	player_default.walk.connect(fsm.change_state.bind(player_movement))
	player_default.ability.connect(fsm.change_state.bind(player_ability))

func ability_signals() -> void:
	player_ability.default.connect(fsm.change_state.bind(player_default))

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


var maxHealth = 3

func take_damage(damage:int):
	character_data.HP -= damage
	if character_data.HP < 0: character_data.HP = 0
	healthBar.change_health(- damage)

func take_heal(heal:int):
	character_data.HP += heal
	healthBar.change_health(heal)

func _on_damage_area_entered(area: Area2D) -> void:
		if area.is_in_group("damage"):
			take_damage(1)


func _on_heal_area_entered(area: Area2D) -> void:
	if area.is_in_group("heal"):
		take_heal(1)
