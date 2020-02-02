extends Control

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		scene_changer.change_scene("res://main.tscn")
