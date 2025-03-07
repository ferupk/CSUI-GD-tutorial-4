extends RigidBody2D

@export var scene_name = "LoseScreen"


func _ready() -> void:
	$DeletionTimer.start()


func _on_HurtBox_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		get_tree().change_scene_to_file(str("res://scenes/" + scene_name + ".tscn"))
	elif body.get_name() == "DeathPlane":
		self.queue_free()


func _on_DeletionTimer_timeout() -> void:
	self.queue_free()
