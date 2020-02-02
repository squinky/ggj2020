extends CanvasLayer

func change_scene(path, delay = 0):
	yield(get_tree().create_timer(delay), "timeout")
	$animation_player.play("fade")
	yield($animation_player, "animation_finished")
	get_tree().change_scene(path)
	$animation_player.play_backwards("fade")
