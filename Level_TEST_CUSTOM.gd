extends Node


onready var Tuna_Position = $Tuna_Kinematic.position.x


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

const TIMER_LIMIT = 2.0
var timer = 0.0

func _process(delta):
	timer += delta
	if timer > TIMER_LIMIT:
		timer = 0.0
		print("fps: " + str(Engine.get_frames_per_second())) #prints something every 2 seconds calling timer limit

		if Tuna_Position -1742 > $Tuna_Kinematic.position.x : #little fish poopy movement
			$Tuna_Kinematic.position.x += 1742
			$School_Fish_Kinematic.position.x += 1742


func _ready():	
	pass # Replace with function body.