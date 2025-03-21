extends RigidBody2D


func _ready() -> void:
	$DeletionTimer.start()


func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		self.set_deferred("freeze", true)
		$CollisionShape2D.set_deferred("disabled", true)
		$DeletionTimer.stop()
		self.hide()
	elif body.get_name() == "DeathPlane":
		self.queue_free()


func _on_DeletionTimer_timeout() -> void:
	self.queue_free()
