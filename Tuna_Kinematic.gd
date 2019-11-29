extends KinematicBody2D


onready var Tuna_position = $Tuna.position.x #tunas position on start


func _physics_process(delta):
	move_and_collide(Vector2(-1,0))



# Called when the node enters the scene tree for the first time.
func _ready():
	$Tuna/AnimationPlayer.play("Move")
	$Tuna2/AnimationPlayer.play("Move")
	$Tuna2/AnimationPlayer.set_speed_scale(0.8)
	$Tuna3/AnimationPlayer.play("Move")
	$Tuna3/AnimationPlayer.set_speed_scale(1.1)
	#tuna movement reset

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
