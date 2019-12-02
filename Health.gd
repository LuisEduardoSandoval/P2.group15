extends Node

signal health_changed(health)
signal health_depleted

var health = 0
const TIMER_LIMIT = 2
var timer = 0.0

export(int) var max_health = 100
func _ready():
	health = max_health
	emit_signal("health_changed",health)

func take_damage(amount):
	health -= amount
	health = max(0,health)
	emit_signal("health_changed",health)

func heal(amount):
	health += amount
	health = max(health, max_health)
	emit_signal("health_changed",health)

func _process(delta):
	timer += delta
	if timer > TIMER_LIMIT:
		timer = 0.0
		take_damage(1)
#	if health == 0:
#		get_tree().change_scene("TlteScreen.tscn")