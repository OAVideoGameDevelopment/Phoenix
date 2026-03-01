extends Node
@export var data : CharacterStats
var health := 0
var stamina := 0
var speed := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = data.max_health
	speed = data.speed
	stamina = data.max_stamina

func take_damage(amount):
	health -= amount
	if health <= 0:
		die()
		
func die():
	get_parent().queue_free()
