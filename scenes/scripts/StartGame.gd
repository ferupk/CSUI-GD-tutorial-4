extends Node2D


func _start_game() -> void:
	Global.lives = 3
	BGMController.change_music("Game")
