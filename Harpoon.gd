extends RigidBody2D

var velocity= Vector2(1000,0)
func _input(event):
    if event.is_action_pressed("click"):
        set_linear_velocity(velocity)

	