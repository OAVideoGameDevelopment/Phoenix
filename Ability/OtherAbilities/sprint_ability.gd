extends AbilityLogic

func use(user):
	#if (ability_active == false): return
	#ability_active = true 
	user.speed_multiplier = 1.5 + (data.level * 0.1)

func while_use(user):
	data.add_exp(1)

func stop_use(user):
	#ability_active = false
	user.speed_multiplier = 1
	
