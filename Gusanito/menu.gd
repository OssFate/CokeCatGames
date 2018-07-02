extends Node

var themeMenu

onready var sato_box = get_node("ThemeMenu/sato_box")
onready var dragon_box = get_node("ThemeMenu/dragon_box")
onready var welcome_text = get_node("Label")

func _ready():
	themeMenu = get_node("ThemeMenu")
	pass

func _on_StartButton_button_up():
	get_tree().change_scene("res://Game.tscn")
	pass

func _on_ThemeButton_button_up():
	themeMenu.show()
	pass

func _on_save_button_up():
	if sato_box.pressed:
		Global.sato = true
		welcome_text.text = "Bienvenidos a Sat0's Harem"
	else:
		welcome_text.text = "Bienvenidos a Snek 3.50"
		Global.sato = false
	
	themeMenu.hide()
	pass

func _on_dragon_box_pressed():
	if !dragon_box.pressed:
		sato_box.pressed = true
	else:
		sato_box.pressed = false
	
	pass # replace with function body

func _on_sato_box_pressed():
	if !sato_box.pressed:
		dragon_box.pressed = true
	else:
		dragon_box.pressed = false
	
	pass # replace with function body
