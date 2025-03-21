extends RigidBody2D


func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		self.set_deferred("freeze", true)
		self.hide()
	else:
		self.queue_free()
