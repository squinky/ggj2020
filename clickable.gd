extends Sprite

signal clicked

export (String) var id

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			var soundarray = $sounds.get_children()
			soundarray[randi() % soundarray.size()].play()
			emit_signal("clicked", id)
