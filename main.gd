extends Node2D

var time_elapsed = 0
var time_total = 300
var last_clicked = null
var last_line = null
var time_since_clicked = 0

func _ready():
	randomize()
	for sprite in $sprites.get_children():
		if sprite is Clickable:
			sprite.connect("clicked", self, "_on_click")
			sprite.connect("ouch", self, "_on_ouch")
	$textbox.text = get_random_line("start")

func _process(delta):
	if $progress.value < 100:
		time_since_clicked += delta
		if time_elapsed < 0:
			time_elapsed = 0
		time_elapsed += delta
		$progress.value = time_elapsed/time_total * 100
		if $progress.value == 100:
			scene_changer.change_scene("res://splash.tscn")

func _on_click(_id):
	if time_since_clicked > 0:
		$textbox.text = get_random_line(_id)
	time_since_clicked = 0

func _on_ouch():
	time_elapsed -= 10
	$textbox.text = get_random_line("ouch")
	$klaxon.play()
	$camera.shake()

func get_random_line(id):
	var textarray = text.dictionary[id]
	var line = randi() % textarray.size()
	# prevent the same line from repeating twice in a row
	if textarray.size() > 1:
		while last_clicked == id && last_line == line:
			line = randi() % textarray.size()
	last_clicked = id
	last_line = line
	return textarray[line]
