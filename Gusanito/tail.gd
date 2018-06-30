extends Area2D

var target
export var delay = 0.5
var temp = 0

var pLog = []

func init(_target):
	print("Initiate the tail order and such")
	target = _target
	print(self.global_position)
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