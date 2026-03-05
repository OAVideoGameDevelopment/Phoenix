extends AbilityLogic

func use(user):
	print("started sprinting")

func while_use(user, delta):
	data.add_exp(20 * delta)

func stop_use(user):
	print("stopped sprinting")
	pass
	
