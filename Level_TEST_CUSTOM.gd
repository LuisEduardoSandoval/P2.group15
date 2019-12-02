extends Node


onready var Tuna_Position = $Tuna_Kinematic.position.x

var n = 0
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

const TIMER_LIMIT = 4.0
var timer = 0.0
var finish = false 
func _process(delta):
	timer += delta
	if timer > TIMER_LIMIT:
		timer = 0.0
	
		#print("fps: " + str(Engine.get_frames_per_second())) #prints something every 2 seconds calling timer limit
		
		if finish == true:
			get_tree().change_scene("TlteScreen.tscn")

		if Tuna_Position -4000 > $Tuna_Kinematic.position.x : #little fish poopy movement
			$Tuna_Kinematic.position.x += 4000
			$School_Fish_Kinematic.position.x += 4000
	if $KinematicBody2D.position.y < 340:
		$Win/Win.set_visible(true)
		finish = true
	if $KinematicBody2D/Health.health == 2:
		$Lose/Lose.set_visible(true)
		var time = 0.0
	if $KinematicBody2D/Health.health == 0:
		get_tree().change_scene("TlteScreen.tscn")
		
		
		
		
		
		


func _ready():	
	var player = AudioStreamPlayer.new()
	self.add_child(player) 
	player.stream = load("res://Sound/sonar-ping.wav")
	player.set_volume_db(-18)
	player.play()
	pass # Replace with function body.