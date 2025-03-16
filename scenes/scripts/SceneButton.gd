extends Control

@export var scene_to_load: String = "MainMenu"


func _on_pressed():
	get_tree().change_scene_to_file("res://scenes/" + scene_to_load + ".tscn")
