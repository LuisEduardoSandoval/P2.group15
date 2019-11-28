extends KinematicBody2D
export var speed = Vector2(200,200) #character move speed
var velocity: = Vector2.ZERO
export var gravity: = 30.0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _physics_process(delta: float) -> void:
	velocity.x = -0.05
	move_and_slide(velocity)
# Called when the node enters the scene tree for the first time.
func _ready():
	$Node2D/AnimationPlayer.play("Move")
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
