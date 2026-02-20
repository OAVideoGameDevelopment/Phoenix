class_name PlayerCharacterData
extends Resource

# Player Character Vars
@export_group("Stats")
@export var HP: int = 3
@export var speed: float = 100.0
@export_group("Physics value")
@export_subgroup("Acceleration & Friction")
@export var acceleration: float = 3000.0
@export var friction: float = 1000.0
@export var air_resistance: float = 200.0
@export var air_acceleration: float = 400.0
@export_group("Misc")
@export var dash_stop_num: int = 150
