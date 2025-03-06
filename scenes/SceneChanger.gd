extends Area2D

@export var sceneName: String = "Level1"


func _on_SceneChanger_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene_to_file(str("res://scenes/" + sceneName + ".tscn"))
