extends Area2D


func _on_body_entered(body):
	if body.get_name() == "Player":
		Global.lives -= 1
		body.kill()
		await get_tree().create_timer(2).timeout
		if Global.lives > 0:
			get_tree().call_deferred("reload_current_scene")
		else:
			get_tree().call_deferred("change_scene_to_file", "res://scenes/GameOver.tscn")
