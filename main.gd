extends Node2D

var time_elapsed = 0
var time_total = 60
var last_clicked = null
var last_line = null

func _ready():
	randomize()
	for sprite in $sprites.get_children():
		sprite.connect("clicked", self, "_on_click")
	$textbox.text = text.dictionary["start"]

func _process(delta):
	time_elapsed += delta
	$progress.value = time_elapsed/time_total * 100

func _on_click(_id):
	var textarray = text.dictionary[_id]
	var line = randi() % textarray.size()
	# prevent the same line from repeating twice in a row
	while last_clicked == _id && last_line == line:
		line = randi() % textarray.size()
	$textbox.text = textarray[line]
	last_clicked = _id
	last_line = line
