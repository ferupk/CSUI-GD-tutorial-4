extends Label


func _ready() -> void:
	var file = FileAccess.open("res://assets/credits.txt", FileAccess.READ)
	self.text = file.get_as_text()
