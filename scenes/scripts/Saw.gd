extends RigidBody2D


func _ready() -> void:
	$DeletionTimer.start()


func _on_HurtBox_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		Global.lives -= 1
		if Global.lives == 0:
			get_tree().call_deferred("change_scene_to_file", "res://scenes/GameOver.tscn")
		else:
			var current_scene = get_tree().get_current_scene().get_name()
			get_tree().call_deferred(
				"change_scene_to_file", "res://scenes/" + current_scene + ".tscn"
			)
	elif body.get_name() == "DeathPlane":
		self.queue_free()


func _on_DeletionTimer_timeout() -> void:
	self.queue_free()
