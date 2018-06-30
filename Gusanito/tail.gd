extends Area2D

var target
export var delay = 0.5
var temp = 0
var lost = 0

var pLog = []
var can_lose

func init(_target, _z_index, _can_lose=true):
	target = _target
	can_lose = _can_lose
	self.z_index = _z_index
	pass

func move():
	#TELEPORT PLZ
	self.global_position = pLog.pop_front()
	pass

func _process(delta):
	temp += delta
	
	if temp >= delay:
		pLog.push_back(target.global_position)
		move()
		pass
	else:
		pLog.push_back(target.global_position)
		pass
	
	pass

func _on_Area2D_body_entered(body):
	if can_lose:
		lost += 1
		print("I LOST THE GAME %s TIMES" % lost)
