extends KinematicBody2D

export var speed = Vector2(200,200) #character move speed
#var velocity = Vector2() #character velocity in 2 Dimensions
var Mouse_Position 
var lastXpos = false #last Direction on axis so head movement is correct false means looking right



export var gravity: = 30.0

var velocity: = Vector2.ZERO





func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right'): 
		velocity.x += 1 
		get_node("root/AnimationPlayer").play("Move") 
#		get_node("root").set_scale(Vector2(1,1)) #flips horazontally
#		lastXpos = false 
	if Input.is_action_pressed('left'):
		velocity.x -= 1
		get_node("root/AnimationPlayer").play("Move")
#		get_node("root").set_scale(Vector2(-1,1))
#		lastXpos = true
		
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	if (velocity.x == 0):
		get_node("root/AnimationPlayer").play("idle")
	velocity = velocity.normalized()* speed


func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	move_and_slide(velocity)
	get_input()
	velocity = move_and_slide(velocity)

func _process(delta): 
	Mouse_Position = get_local_mouse_position() #this must be initialized or it will crash when it calls 

	if Input.is_action_pressed('right'): #had to check movement here as it controls rotational diretion of head
		Mouse_Position = get_local_mouse_position() #if movement in the right direction updates head directional position
	if Input.is_action_pressed('left'): 
		Mouse_Position.x = -get_local_mouse_position().x #changes head x to match movements
		Mouse_Position.y = get_local_mouse_position().y
#		if Mouse_Position.x 
		
	if lastXpos == true:
		Mouse_Position.x = -get_local_mouse_position().x
		Mouse_Position.y = get_local_mouse_position().y
	if lastXpos == false:
		Mouse_Position.x = get_local_mouse_position().x
		Mouse_Position.y = get_local_mouse_position().y
	get_node("root/Hip/Torso/Head").rotation += Mouse_Position.angle() #changes the angle of the head to match mouse
	get_node("root/Hip/Torso/Arm_R/Hand_R").rotation += Mouse_Position.angle()
	#get_node("root/Hip/Torso/Arm_R/Harpoon_Gun").rotation += Mouse_Position.angle()
	if lastXpos == false: #if player is facing right!
		if get_local_mouse_position().x < $root.position.x : # if players mouse is on or behind root node
			get_node("root").set_scale(Vector2(-1,1))#models is scaled verticaly and horizontally
			lastXpos = true
	if lastXpos == true: 
		if get_local_mouse_position().x > $root.position.x :
			get_node("root").set_scale(Vector2(1,1))
			lastXpos = false

	pass
	



 

func _ready():
	get_node("root/AnimationPlayer").play("idle")
	pass

	