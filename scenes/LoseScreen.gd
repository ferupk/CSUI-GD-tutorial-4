extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file(str("res://scenes/" + Global.current_level + ".tscn"))
