extends Sprite

signal clicked
signal ouch

export (String) var id
export (bool) var ouchy

var ouch_counter = 0
var time_since_ouch = 0

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			if ouchy:
				ouch_counter += 1
				if ouch_counter >= 3:
					emit_signal("ouch")
					return
			if has_node("sounds"):
				var soundarray = $sounds.get_children()
				soundarray[randi() % soundarray.size()].play()
			emit_signal("clicked", id)

func _process(delta):
	if ouch_counter > 0:
		time_since_ouch += delta
		if time_since_ouch > 60:
			time_since_ouch = 0
			ouch_counter = 0
