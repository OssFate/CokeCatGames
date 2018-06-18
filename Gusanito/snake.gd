extends KinematicBody2D

var motion = Vector2()
export var speed = 100

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		motion.y = 0
		
	if Input.is_action_pressed("ui_left"):
		motion.x = -speed
		motion.y = 0
	
	if Input.is_action_pressed("ui_up"):
		motion.x = 0
		motion.y = -speed
		
	if Input.is_action_pressed("ui_down"):
		motion.x = 0
		motion.y = speed
	
	move_and_slide(motion)