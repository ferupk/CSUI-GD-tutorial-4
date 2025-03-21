extends Node


func _ready() -> void:
	fade_out()


func fade_in() -> void:
	$Foreground.visible = true
	$Foreground/AnimationPlayer.play("ForegroundIn")
	await $Foreground/AnimationPlayer.animation_finished


func fade_out() -> void:
	$Foreground/AnimationPlayer.play("ForegroundOut")
	await $Foreground/AnimationPlayer.animation_finished
	$Foreground.visible = false
