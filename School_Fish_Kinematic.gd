extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	move_and_collide(Vector2(-1,0))

func _ready():
	$School_fish/AnimationPlayer.play("Move")
	$School_fish2/AnimationPlayer.play("Move")
	$School_fish2/AnimationPlayer.set_speed_scale(0.8)
	$School_fish3/AnimationPlayer.play("Move")
	$School_fish3/AnimationPlayer.set_speed_scale(1.1)
	$School_fish4/AnimationPlayer.play("Move")
	$School_fish5/AnimationPlayer.play("Move")
	$School_fish5/AnimationPlayer.set_speed_scale(0.8)
	$School_fish6/AnimationPlayer.play("Move")
	$School_fish6/AnimationPlayer.set_speed_scale(1.1)
	$School_fish7/AnimationPlayer.play("Move")
	$School_fish8/AnimationPlayer.play("Move")
	$School_fish8/AnimationPlayer.set_speed_scale(0.8)
	$School_fish9/AnimationPlayer.play("Move")
	$School_fish9/AnimationPlayer.set_speed_scale(1.1)
	$School_fish10/AnimationPlayer.play("Move")
	$School_fish11/AnimationPlayer.play("Move")
	$School_fish11/AnimationPlayer.set_speed_scale(0.8)
	$School_fish12/AnimationPlayer.play("Move")
	$School_fish12/AnimationPlayer.set_speed_scale(1.1)
	$School_fish13/AnimationPlayer.play("Move")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
