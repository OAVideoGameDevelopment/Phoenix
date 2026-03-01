
extends Resource
class_name AbilityData

@export var name: String
@export var base_damage := 10.0
@export var cooldown := 0.5
@export var consumption := 10.0 # IS IT STAMINA??? I DONT KNOW I FORGOT TS GAME IS DOOMED BRO
@export var hp_consumption := 0.0

@export var level := 1
@export var exp := 0.0
@export var starting_exp := 100.0
@export var exp_scaling := 100.0 # +100 exp needed for every additional level
@export var exp_to_level := 100.0

func get_damage():
	return base_damage * level

func add_exp(amount):
	exp += amount
	calc_level()
	
func calc_level(): # calc is short for calculator by the way
	while (exp >= exp_to_level):
		exp -= exp_to_level
		level += 1
		exp_to_level = level * exp_scaling
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
