extends KinematicBody2D

const gameInstance = preload("res://Game.gd")

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
	
	if get_slide_count() > 0 :
		var coll = get_slide_collision(0)
		coll.collider.queue_free()
		get_bigger()
		#re spawn fruit
		get_node("..").spawn_fruit()

func get_bigger():
	#Should get big here :D
	print("ITS GONNA BE HUUUUGGGEEEEE")