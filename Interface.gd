extends Control
signal health_changed(health)

const TIMER_LIMIT = 2.0
var timer = 0.0

func _ready():
	var health_node = null
	for node in get_tree().get_nodes_in_group("actors"):
		if node.name == "KinematicBody2D":
			node.get_node("Health")
			break
		$Bars/Bar.initialize(health_node.max_health)


	



func _on_Health_health_changed(health):
	emit_signal("health_changed",health)

