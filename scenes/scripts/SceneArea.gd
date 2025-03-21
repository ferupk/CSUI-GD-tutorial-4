extends Area2D

@export var scene_name: String = "Level1"


func _on_body_entered(body):
	if body.get_name() == "Player":
		get_tree().call_deferred("change_scene_to_file", "res://scenes/" + scene_name + ".tscn")
