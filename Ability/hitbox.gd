extends Area2D


# Called when the node enters the scene tree for the first time.
	
var damage := 0.0;

func initHitbox(data : AbilityData, user : CharacterBody2D):
	damage = data.base_damage
	
	user.add_child(self)
	
	var mouse_pos = get_global_mouse_position()
	var direction = (mouse_pos - user.global_position).normalized()
	
	global_position = user.global_position + direction * data.melee_hitbox_offset.length()
	rotation = direction.angle()
	
	scale = data.melee_hitbox_size
	
	await get_tree().create_timer(data.melee_hitbox_delay).timeout
	connect("body_entered", _on_body_entered)
	await get_tree().create_timer(data.melee_hitbox_duration).timeout
	
	queue_free()

func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
		
		
		
