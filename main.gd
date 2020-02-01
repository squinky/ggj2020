extends Node2D

func _ready():
	randomize()
	for clickable in $clickables.get_children():
		clickable.connect("clicked", self, "_on_click")
	$textbox.text = "Click on the thing. Go ahead. Do it."

func _on_click(_id):
	var textarray = text.dictionary[_id]
	$textbox.text = textarray[randi() % textarray.size()]
