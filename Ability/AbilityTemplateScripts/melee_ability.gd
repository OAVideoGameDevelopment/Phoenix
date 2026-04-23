extends AbilityLogic

var HitboxScene = preload("res://Ability/hitbox.tscn")


func use(user):
	if (data.melee_hitbox_enable):
		melee_attack(user)
		data.add_exp(50)
	pass
	
func stop_use(user):
	print(data.name+" has stopped.")
	pass
	
func while_use(user, delta: float):
	pass


func melee_attack(user):
	var hitbox = HitboxScene.instantiate()
	hitbox.initHitbox(data, user)
	print("you melee attacked, what???")
	
