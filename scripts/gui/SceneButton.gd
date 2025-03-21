extends Control

@export var scene_to_load: String = "MainMenu"


func _on_pressed():
	if scene_to_load == "MainMenu":
		BGMController.change_music("Menu")
	await ScreenFill.fade_in()
	get_tree().change_scene_to_file("res://scenes/" + scene_to_load + ".tscn")
	await ScreenFill.fade_out()
