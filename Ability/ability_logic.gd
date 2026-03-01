extends Node
class_name AbilityLogic

@export var data: AbilityData
# make sure to override this. 
func use(user):
	pass
	
func stop_use(user):
	pass
	
func while_use(user, delta: float):
	pass
	
