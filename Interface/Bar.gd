extends HBoxContainer
var maximum_value = 100
const TIMER_LIMIT = 2.0
var timer = 0.0
func initialize(maximum):
	maximum_value = maximum
	$TextureProgress.max_value = maximum

func _process(delta):
	timer += delta
	if timer > TIMER_LIMIT:
		timer = 0.0
	


func _on_Interface_health_changed(health):
	$TextureProgress.value = health
	$Counter/Label.text = "%s" %[health]
		
	
	
	



		