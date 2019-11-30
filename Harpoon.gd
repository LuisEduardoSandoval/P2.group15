extends KinematicBody2D

const THROW_VELOCITY = Vector2(1000,0)

var velocity = Vector2.ZERO

func _ready():
	set_physics_process(false)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision != null:
		_on_impact(collision.normal)
		
func launch(direction):
	var temp = global_transform
	var scene = get_tree().current_scene
	get_parent().remolve_child(self)
	global_transform = temp
	velocity = THROW_VELOCITY * Vector2(direction, 1)
	set_physics_process(true)

func _on_impact(normal : Vector2):
	velocity = velocity.stick(normal)
	