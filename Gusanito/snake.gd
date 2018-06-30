extends KinematicBody2D

var windowSize = OS.get_window_safe_area().size
export var outOffset = 0
export var relocate = false

export var speed = 100
var motion = Vector2()

var tailObject = load("res://tail.tscn")
var tail = []

func _ready():
	motion = Vector2(speed, 0)
	
	var defaultTail = tailObject.instance()
	defaultTail.init(self, -1,false)
	tail.append(defaultTail)
	add_child(tail[0])
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		motion = Vector2(speed, 0)
		
	if Input.is_action_pressed("ui_left"):
		motion = Vector2(-speed, 0)
	
	if Input.is_action_pressed("ui_up"):
		motion = Vector2(0, -speed)
		
	if Input.is_action_pressed("ui_down"):
		motion = Vector2(0, speed)
	
	move_and_slide(motion)
	
	if outOfBounds() and relocate:
		relocateSnek()
	
	if get_slide_count() > 0 :
		var coll = get_slide_collision(0)
		coll.collider.queue_free()
		get_bigger()
		#re spawn fruit
		get_node("..").spawn_fruit()

func relocateSnek():
	var delta = 0
	
	if motion.x == speed:
		delta = self.position.x - (windowSize.x + outOffset)
		self.position.x = delta
	elif motion.x == -speed:
		delta = self.position.x - outOffset
		self.position.x = windowSize.x + delta
	elif motion.y == speed:
		delta = self.position.y - (windowSize.y + outOffset)
		self.position.y = delta
	elif motion.y == -speed:
		delta = self.position.y - outOffset
		self.position.y = windowSize.y + delta
	else:
		print("Something weird happened")
	pass

func outOfBounds():
	var pos = self.position
	var bounds = [0 - outOffset, windowSize.x + outOffset, windowSize.y + outOffset]
	
	if pos.x < bounds[0] or pos.x > bounds[1] or pos.y < bounds[0] or pos.y > bounds[2]:
		return true
	
	return false

func get_bigger():
	var newTail = tailObject.instance()
	newTail.init(tail.back(), (tail.size() * -1) - 2)
	tail.append(newTail)
	add_child(newTail)
	pass