extends Control

@export var scene: String = "Level1"
@onready var continue_button = $MarginContainer/VBoxContainer/VBoxContainer/Continue


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.hide()
	continue_button.scene_to_load = scene
