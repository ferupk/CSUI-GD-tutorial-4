extends CanvasLayer


func _ready() -> void:
	fade_out()


func fade_in() -> void:
	self.visible = true
	$AnimationPlayer.play("ForegroundIn")
	await $AnimationPlayer.animation_finished


func fade_out() -> void:
	$AnimationPlayer.play("ForegroundOut")
	await $AnimationPlayer.animation_finished
	self.visible = false
