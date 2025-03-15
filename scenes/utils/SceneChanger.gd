extends Area2D

@export var scene_name: String = "Level1"


func _on_SceneChanger_body_entered(body):
	var current_scene = get_tree().get_current_scene().get_name()
	if body.get_name() == "Player":
		if current_scene == scene_name:
			Global.lives -= 1
		if self.get_name() == "RocketGoal" and scene_name.begins_with("Level"):
			Global.current_level = scene_name
		if Global.lives == 0:
			get_tree().change_scene_to_file("res://scenes/Game Over.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/" + scene_name + ".tscn")
