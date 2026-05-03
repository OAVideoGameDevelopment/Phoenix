extends CharacterBody2D

@export var character_data : PlayerCharacterData

@onready var healthBar = $HealthBar

@onready var maxHealth : float = character_data.HP


func _ready() -> void:
	healthBar.set_health_bar(character_data.HP, maxHealth)

func take_damage(damage:int):
	character_data.HP -= damage
	if character_data.HP < 0: character_data.HP = 0
	healthBar.change_health(-damage)

func take_heal(heal:int):
	character_data.HP += heal
	healthBar.change_health(heal)

func _on_damage_area_entered(area: Area2D) -> void:
		if area.is_in_group("damage"):
			take_damage(1)

func _on_heal_area_entered(area: Area2D) -> void:
	if area.is_in_group("heal"):
		take_heal(1)


func _physics_process(delta: float) -> void:
	move_and_slide()
