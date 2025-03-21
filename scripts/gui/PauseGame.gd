extends LinkButton


func _pause_game() -> void:
	Engine.time_scale = 0


func _resume_game() -> void:
	Engine.time_scale = 1
