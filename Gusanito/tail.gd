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
	print(temp)
	print(pLog.size())
	print("Global Pos: %s" %self.global_position)
	print("Local Pos: %s" %self.position)
	#TELEPORT PLZ
	self.global_position = pLog.pop_front()
	pass

func _process(delta):
	temp += delta
	
	if temp >= delay:
		print("Added new position and move")
		pLog.push_back(target.position)
		move()
		pass
	else:
		print("Added new position")
		pLog.push_back(target.position)
		pass
	
	pass