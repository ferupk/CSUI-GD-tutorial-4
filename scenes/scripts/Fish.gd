extends RigidBody2D


func _on_HurtBox_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		Global.lives -= 1
		if Global.lives > 0:
			var current_scene = get_tree().get_current_scene().get_name()
			get_tree().call_deferred(
				"change_scene_to_file", "res://scenes/" + current_scene + ".tscn"
			)
		else:
			get_tree().call_deferred("change_scene_to_file", "res://scenes/GameOver.tscn")
	else:
		self.queue_free()
