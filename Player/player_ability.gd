extends State
class_name PlayerAbility

@export var actor: Player
@export var animator: AnimatedSprite2D
@export var animation: AnimationPlayer

@export var ability : AbilityLogic

signal default

var timeStarted : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_physics_process(false)
	set_process(false)

func _enter_state() -> void:
	set_physics_process(true)
	set_process(true)
	timeStarted = Time.get_ticks_msec()
	ability.use(actor)

func _exit_state() -> void:
	set_process(false)
	set_physics_process(false)
	ability.stop_use(actor)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Time.get_ticks_msec() - timeStarted > ability.data.cooldown * 1000):
		default.emit()
		return
	ability.while_use(actor, delta)
	pass
