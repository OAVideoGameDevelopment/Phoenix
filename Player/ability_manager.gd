extends Node

@export var slottedAbilities: Array[AbilityLogic] = []
var abilitiesInfo := {}

@export var movementAbility : AbilityLogic # will probably only be sprinting by the way lol. 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for ability in slottedAbilities:
		abilitiesInfo.set(ability, {
			Ability = ability,
			Active = false,
			Cooldown = 0,
		})

func use_ability(ability_logic: AbilityLogic):
	if abilitiesInfo[ability_logic].Cooldown > 0: return
	var abilityInfo = abilitiesInfo[ability_logic]
	abilityInfo.Active = true
	abilityInfo.Cooldown = abilitiesInfo.Ability.Data.Cooldown
	abilitiesInfo.Ability.use(get_parent())
	
func stop_using_ability(ability_logic: AbilityLogic):
	var abilityInfo = abilitiesInfo[ability_logic]
	abilityInfo.Active = false
	abilityInfo.Cooldown = abilitiesInfo.Ability.Data.Cooldown
	abilitiesInfo.Ability.stop_use(get_parent())
	
func _process(delta):
	for values in abilitiesInfo:
		values.Cooldown = max(0, values.Cooldown - delta)
		if (values.Active):
			values.Ability.while_use(get_parent(), delta)
			
		
		
