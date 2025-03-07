extends Area2D

@export var scene_name: String = "Level1"


func _on_SceneChanger_body_entered(body):
	if body.get_name() == "Player":
		if self.get_name() == "RocketGoal" and scene_name.begins_with("Level"):
			Global.current_level = scene_name
		get_tree().change_scene_to_file(str("res://scenes/" + scene_name + ".tscn"))
