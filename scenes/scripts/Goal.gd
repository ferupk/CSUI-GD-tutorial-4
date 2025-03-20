@tool
extends Area2D

@export var last: bool:
	set(value):
		last = value
		notify_property_list_changed()
@export var scene_to_load: String = "Level1"


func _validate_property(property: Dictionary):
	if property.name == "scene_to_load" and last:
		property.usage |= PROPERTY_USAGE_READ_ONLY


func _ready() -> void:
	if last:
		$CanvasLayer/ClearMenu.scene = "WinScreen"
	else:
		$CanvasLayer/ClearMenu.scene = scene_to_load


func _on_body_entered(body):
	if body.get_name() == "Player":
		body.disable_controls()
		body.hide()

		$AnimationPlayer.play("Fly")
		await $AnimationPlayer.animation_finished

		$CanvasLayer/ClearMenu.show()
