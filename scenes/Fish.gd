extends RigidBody2D

@export var scene_name = "LoseScreen"


func _on_HurtBox_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		get_tree().change_scene_to_file(str("res://scenes/" + scene_name + ".tscn"))
	else:
		self.queue_free()
