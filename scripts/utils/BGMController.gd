extends Node

@onready var bgm = {
	"Menu": load("res://assets/bgm/menu.ogg"),
	"Game": load("res://assets/bgm/gameplay.ogg"),
	"Win": load("res://assets/bgm/win.ogg"),
	"Lose": load("res://assets/bgm/gameover.ogg"),
}


func _ready() -> void:
	$BGM.stream = bgm.Menu
	$BGM.play()


func play() -> void:
	$BGM.play()


func stop() -> void:
	$BGM.stop()


func change_music(music) -> void:
	$BGM.stream = bgm[music]
	$BGM.play()
