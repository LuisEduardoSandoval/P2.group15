extends KinematicBody2D

var speed = 90
const gravity = 0
var health = 2

var velocity = Vector2(0,0)
var direction_x = 1
var direction_y = 1
var direction = 1

var eye_reach = 90
var vision = 200
onready var player = get_parent().get_node("KinematicBody2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func player_range():
	get_node("Shark")
	if player.position.x < position.x - 500 || player.position.x > position.x:
		return false
	if player.position.x < position.x || player.position.x > position.x:
		$Shark/AnimationPlayer.play("Attack")
		
		return true
	if player.position.y < position.y -300 || player.position.y > position.y +300:
		return false
	if player.position.y < position.y  || player.position.y > position.y :
		return true
	if player.position.x > position.x + 500:
		return true
	else:
		return false

func _physics_process(delta):
#	velocity.x = speed * direction_x
#	velocity.y = 0
	get_node("Shark").set_scale(Vector2(direction_x,direction_y))
	$Shark/AnimationPlayer.play("Move")
	velocity.y += gravity
	
#	velocity = (player.position - position).normalized() 
	velocity = move_and_slide(velocity)
	# if player.position.x < position.x+ 100 || position.x -100
	if player.position.x < position.x -100  and player_range():
		velocity.x = -350
		get_node("Shark").set_scale(Vector2(-1,1))
	elif player.position.x < position.x -150 and player_range():
		velocity.x = 350
		get_node("Shark").set_scale(Vector2(1,1))
		
	else: 
		velocity.x = 0

	
	if player.position.y < position.y- 50:
		velocity.y =-250
	elif player.position.y > position.y + 50: 
		velocity.y =250
	else:
		velocity.y = 0
	if not player_range():
			velocity.x = speed * direction_x
			velocity.y = 0
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
#			get_parent().get_node("KinematicBody2D/Health").health -= 20
			
		direction_x = direction_x * -1
		get_node("Shark").set_scale(Vector2(direction_x,direction_y))
		

	



func _on_Area2D_area_entered(area):
	health = health - 1
	if health == 0:
		get_parent().remove_child(self)
	pass # Replace with function body.





func _on_Player_area_area_entered(area):
	get_parent().get_node("KinematicBody2D/Health").health -= 20
