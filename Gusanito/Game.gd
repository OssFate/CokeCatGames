extends Node

var projectResolution = OS.get_window_safe_area().size
var fruitOffset = 32

var snake = load("res://snake.tscn")
var fruit = load("res://Fruit.tscn")
var seconds = 0
onready var timer = get_node("Timer")

var tail = []

func _ready():
	tail.append(snake.instance())
	#print(projectResolution)
	
	add_child(tail[0])
	spawn_fruit()
	pass

func spawn_fruit():
	var node = fruit.instance()
	var newPos = Vector2(rand_range(fruitOffset, projectResolution.x - fruitOffset), rand_range(fruitOffset, projectResolution.y - fruitOffset))
	node.position = newPos
	#print(newPos)
	add_child(node)
	pass

func spawn_fruit_at(pos):
	var node = fruit.instance()
	node.position = pos
	
	add_child(node)
	pass

func _on_Spawn_button_up():
	#spawn_fruit()
	pass # replace with function body

func _process(delta):
	seconds += delta
	timer.set_text("tiempo %d segundos" % seconds)
	pass