extends ProgressBar

@export var label : Label

func set_health_bar(health, maxHealth):
	max_value = maxHealth
	value = health
	
	if label:
		label.text = str(health)

func change_health(newValue):
	value += newValue
	
	if label:
		label.text = str(value)
