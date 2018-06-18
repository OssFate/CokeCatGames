extends Node

var snake = load("res://snake.tscn")
var fruit = load("res://Fruit.tscn")
var seconds = 0;
onready var timer = get_node("Label")

var tail = []

func _ready():
	tail.append(snake.instance())
	
	add_child(tail[0])
	pass

func spawn_fruits():
	var projectResolution = OS.get_real_window_size()
	
	var node = fruit.instance()
	var newPos = Vector2(rand_range(0, projectResolution.x), rand_range(0, projectResolution.y))
	node.position = newPos
	
	add_child(node)
	
	pass

func _on_Spawn_button_up():
	spawn_fruits()
	pass # replace with function body

func _process(delta):
	seconds += delta;
	timer.set_text("tiempo %d segundos" % seconds)
	pass