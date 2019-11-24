extends KinematicBody2D

export (int) var speed = 200 #character move speed
var velocity = Vector2() #character velocity in 2 Dimensions
var Mouse_Position 
var lastXpos #last Direction on axis so head movement is correct 



func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right'): 
		velocity.x += 1 
		get_node("root/AnimationPlayer").play("Move") 
		get_node("root").set_scale(Vector2(1,1)) #flips horazontally
		lastXpos = false 
	if Input.is_action_pressed('left'):
		velocity.x -= 1
		get_node("root/AnimationPlayer").play("Move")
		get_node("root").set_scale(Vector2(-1,1))
		lastXpos = true
		
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	if (velocity.x == 0):
		get_node("root/AnimationPlayer").play("idle")
	velocity = velocity.normalized()* speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

func _process(delta):
	Mouse_Position = get_local_mouse_position() #this must be initialized or it will crash when it calls
	if Input.is_action_pressed('right'): #had to check movement here as it controls rotational diretion of head
		Mouse_Position = get_local_mouse_position()*0.1
	if Input.is_action_pressed('left'):
		Mouse_Position.x = get_local_mouse_position().x*-0.1
		Mouse_Position.y = get_local_mouse_position().y*0.1
	if lastXpos == true:
		Mouse_Position.x = get_local_mouse_position().x*-0.1
		Mouse_Position.y = get_local_mouse_position().y*0.1
	get_node("root/Hip/Torso/Head").rotation += Mouse_Position.angle() #changes the angle of the head to match mouse
#	if lastXpos == false: #IN_PROGRESS CHANGES WHEN MOUSE X IS TOO FAR FOR HEAD TO FOLLOW POSITION CHANGES
#		if get_local_mouse_position().x < $root.global_position.x -200:
#			get_node("root").set_scale(Vector2(-1,-1))
#		if get_local_mouse_position().x > $root.global_position.x -200:
#			get_node("root").set_scale(Vector2(1,1))
#			Mouse_Position.x = get_local_mouse_position().x*0.1
	#if get_local_mouse_position().x < $root/Hip.global_position.x :
	pass
	





func _ready():
	get_node("root/AnimationPlayer").play("idle")
	pass

