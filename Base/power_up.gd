extends Area2D

var count := 0
var num := 0
var timer = 0

func power_up_collected(body: CharacterBody2D) -> void:
	assert(body as Player, "Body must be an instance of Player")
	count += 1
	num += 1
	if count == 1: print(timer)
	queue_free()

func _process(delta: float):
	timer += delta

func stop() -> void:
	set_process(false)
