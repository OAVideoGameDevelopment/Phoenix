extends ProgressBar
@onready var label = $Label

func _ready():
	set_health_bar(value, max_value)

func set_health_bar(health, maxHealth):
	max_value = maxHealth
	value = health
	
	if label:
		var percent = (float(value) / max_value) * 100
		label.text = str(int(round(percent))) + "%"

func change_health(newValue):
	value += newValue
	
	if label:
		var percent = (float(value) / max_value) * 100
		label.text = str(int(round(percent))) + "%"
