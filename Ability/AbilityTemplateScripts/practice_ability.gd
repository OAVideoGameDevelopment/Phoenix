extends AbilityLogic

func use(user):
	print(data.name + " has started.")
	data.add_exp(50)
	pass
	
func stop_use(user):
	print(data.name+" has stopped.")
	pass
	
func while_use(user, delta: float):
	pass
