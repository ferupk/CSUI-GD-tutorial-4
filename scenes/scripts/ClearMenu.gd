extends Control

@export var scene: String = "Level1"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.hide()


func _on_continue_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/" + scene + ".tscn")


func _on_quit_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/MainMenu.tscn")
