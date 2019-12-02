extends KinematicBody2D

export var speed = Vector2(200,200) #character move speed
#var velocity = Vector2() #character velocity in 2 Dimensions
var Mouse_Position 
var lastXpos = false #last Direction on axis so head movement is correct false means looking right

var harpoon = preload("res://Harpoon.tscn")
var can_fire = true
var rate_of_fire = .5


export var gravity: = 30.0
#export (float) var harpoon_delay = 1
#var waited = 0
#export (PackedScene) var Harpoon
#export (NodePath) var harpoon_spawn_path
#export (int) var  harpoon_gravity = 0
#export (int) var harpoon_speed = 8
#export (float) var harpoon_angle = 0 setget set_harpoon_angle
#var directional_force = Vector2()
#var shooting =  false
#onready var harpoon_spawn = get_node(harpoon_spawn_path)


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
	

#func set_harpoon_angle(value):  
#	harpoon_angle = clamp(value, 0, 359)          

#func update_directional_force():
#	directional_force = Vector2(cos(harpoon_angle*(PI/180)), sin(harpoon_angle*(PI/180))) * harpoon_speed


func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	move_and_slide(velocity)
	get_input()
	velocity = move_and_slide(velocity)
	

func _process(delta): 
	Mouse_Position = get_local_mouse_position() #this must be initialized or it will crash when it calls 
	
	SkillLoop()
	
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
	#if(shooting && waited > harpoon_delay):
		#fire_once()
		#waited = 0
	#elif(waited <= harpoon_delay):
		#waited += delta
	pass


func SkillLoop():
	if Input.is_action_pressed("click") and can_fire == true:
		can_fire = false
		get_node("root/Hip/Torso/Arm_R/Hand_R/Harpoon_Gun/TurnAxis").rotation = get_angle_to(get_global_mouse_position())
		var harpoon_instance = harpoon.instance()
		harpoon_instance.position = get_node("root/Hip/Torso/Arm_R/Hand_R/Harpoon_Gun/TurnAxis/CastPoint").get_global_position()
		harpoon_instance.rotation = get_angle_to(get_global_mouse_position())
		get_parent().add_child(harpoon_instance)
		yield(get_tree().create_timer(rate_of_fire), "timeout")
		can_fire = true
#func fire_once():
	#shoot()
	#shooting = false

#func _input(event):
	#if(event.is_action_pressed("click")):
		
		#shooting = true
	#elif(event.is_action_released("click")):
		#shooting = false

#func shoot():
	#var harpoon = Harpoon.instance()
	#harpoon.instance()
	#add_child(harpoon)
	#harpoon.shoot(directional_force, harpoon_gravity)
	#get_parent().add_child(harpoon)
 

func _ready():
	get_node("root/AnimationPlayer").play("idle")
	#update_directional_force()
	set_process_input(true)
	set_process(true)
	pass

	