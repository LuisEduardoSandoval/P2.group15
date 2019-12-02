extends KinematicBody2D

var speed = 90
const gravity = 0

var velocity = Vector2()
var direction_x = 1
var direction_y = 1
var direction = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):
	velocity.x = speed * direction_x
	velocity.y = 0
	
	get_node("Shark").set_scale(Vector2(direction_x,direction_y))
	$Shark/AnimationPlayer.play("Move")
	velocity.y += gravity
	velocity = move_and_slide(velocity)
	

#	if is_on_wall():
#		direction_x = direction_x * -1
#		get_node("Shark").set_scale(Vector2(direction_x,direction_y))
#
#	if is_on_ceiling():
#		direction_y = direction_y *-1
#		get_node("Shark").set_scale(Vector2(direction_x,direction_y))
		
	if $Shark/hor.is_colliding() == true:
#		if $Shark/hor.get_collider():
#			get_parent().get_node("KinematicBody2D/Health.health").health -= 20
			
		direction_x = direction_x * -1
		get_node("Shark").set_scale(Vector2(direction_x,direction_y))
		
	
	

