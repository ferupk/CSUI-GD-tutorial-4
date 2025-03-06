extends Node2D

@export var obstacle: PackedScene
@export var spawn_range = 1000
@export var view_guide = true

@onready var spawn_guide = $SpawnerGuide


func _ready():
	if view_guide:
		spawn_guide.scale.x = (2 * spawn_range) / spawn_guide.texture.get_width()
		spawn_guide.global_position.y = -get_viewport_transform().origin[1] + 16
	else:
		spawn_guide.visible = false
	repeat()


func _process(_delta: float) -> void:
	if view_guide:
		var next_position = -get_viewport_transform().origin[1] + 16
		if next_position > self.get_global_transform().origin[1]:
			spawn_guide.global_position.y = next_position
		else:
			spawn_guide.global_position.y = self.get_global_transform().origin[1]
	pass


func spawn():
	var spawned = obstacle.instantiate()
	get_parent().add_child(spawned)

	var spawn_pos = global_position
	spawn_pos.x = spawn_pos.x + randf_range(-spawn_range, spawn_range)

	spawned.global_position = spawn_pos


func repeat():
	spawn()
	await get_tree().create_timer(1).timeout
	repeat()
