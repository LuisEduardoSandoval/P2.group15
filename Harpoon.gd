extends RigidBody2D


var speed = 1000

func _ready():
	apply_impulse(Vector2(speed,0).rotated(rotation), Vector2(speed, 0).rotated(rotation))

#export (float) var _gravity = 0
#var _movement = Vector2()
#
#func shoot(directional_force, gravity) :
#	_movement = directional_force
#	_gravity = gravity
#
#	#set_fixed_process(true)
#
#func _fixed_process(delta):
#	_movement.y += delta * _gravity
#	mo(_movement)

#func _physics_process(delta):
#	if $Harpoon/kill.is_colliding() == true:
#		if $Harpoon/kill.get_collider():
#			get_parent().get_node("Shark_Kinematic").health -= 1
	
