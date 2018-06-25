extends Node

#Scenes
var snake = load("res://snake.tscn")
var fruit = load("res://Fruit.tscn")

#Variables

#Fruit spawn
var projectResolution = OS.get_window_safe_area().size
var fruitOffset = 32

#Timer
var seconds = 0
onready var timer = get_node("Timer")

#Le Snek
#var tail = []
var realSnek

func _ready():
	#tail.append(snake.instance())
	realSnek = snake.instance()
	#print(projectResolution)
	
	add_child(realSnek)
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

########################################################################################################
#### Weird useless code starts here
########################################################################################################
##Enum
#enum Zone { ZLeft, ZRight, ZUp, ZDown, ZoneSama, OutZoned, ZUR, ZUL, ZDR, ZDL }
#
##Wall Hacks
#var currentZone = Zone.ZoneSama
#var zoneLimit = [0,0,0,0]
#var zoneLimitFactor = 0.1
#var snekClone = {}
#
#func wall_hacks():
#	var tempZone = currentZone
#
#	currentZone = getLeZone(realSnek)
#
#	if currentZone != ZoneSama:
#
#		print("wut")
#
#	pass
#
#func setZonesLimits():
#	zoneLimit[0] = projectResolution.x * zoneLimitFactor
#	zoneLimit[1] = projectResolution.y * zoneLimitFactor
#	zoneLimit[2] = projectResolution.x * (1 - zoneLimitFactor)
#	zoneLimit[3] = projectResolution.y * (1 - zoneLimitFactor)
#	pass
#
#func createSnekClone(key):
#	snekClone[key] = realSnek.duplicate()
#	var newPos
#
#	pass
#
#func getLeZone(sneekyPos):
#	var leZone = ZoneSama
#
#	if sneekyPos.x < 0 or sneekyPos.x > projectResolution.x or sneekyPos.y < 0 or sneekyPos.y > projectResolution.y:
#		leZone = OutZoned
#		return leZone
#	elif sneekyPos.x > zoneLimit[0] and sneekyPos.x < zoneLimit[2] and sneekyPos.y > zoneLimit[1] and sneekyPos.y < zoneLimit[3]:
#		leZone = ZoneSama
#		return leZone
#
#	if sneekyPos.x >= 0 and sneekyPos.x < zoneLimit[0]:
#		leZone = ZLeft
#	elif sneekyPos.x <= projectResolution.x and sneekyPos.x > zoneLimit[2]:
#		leZone = ZRight
#
#	if sneekyPos.y >= 0 and sneekyPos.y < zoneLimit[1]:
#		match leZone:
#			ZLeft:
#				leZone = ZUL
#			ZRight:
#				leZone = ZUR
#			_:
#				leZone = ZUp
#	elif sneekyPos.y > zoneLimit[3] and sneekyPos.y <= projectResolution.y:
#		match leZone:
#			ZLeft:
#				leZone = ZDL
#			ZRight:
#				leZone = ZDR
#			_:
#				leZone = ZDown
#
#	return leZone