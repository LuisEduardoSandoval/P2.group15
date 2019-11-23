extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

var Mouse_Position


func get_input():
    velocity = Vector2()
    if Input.is_action_pressed('right'):
        velocity.x += 1
    if Input.is_action_pressed('left'):
        velocity.x -= 1
    if Input.is_action_pressed('down'):
        velocity.y += 1
    if Input.is_action_pressed('up'):
        velocity.y -= 1
    velocity = velocity.normalized() * speed


func _physics_process(delta):
    get_input()
    velocity = move_and_slide(velocity)

func _process(delta):
	Mouse_Position = get_local_mouse_position()*0.1
	#rotation += Mouse_Position.angle()
	get_node("root/Hip/Torso/Head").rotation += Mouse_Position.angle()
	pass




# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("root/AnimationPlayer").play("idle")
	

	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
