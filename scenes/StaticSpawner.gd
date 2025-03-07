extends Node2D

@export var obstacle: PackedScene
@export var view_guide = true
@export var spawn_interval = 2.5
@export var start_offset = 0.0

@onready var spawn_guide = $SpawnerGuide


func _ready():
	if !view_guide:
		spawn_guide.visible = false
		
	if start_offset:
		await get_tree().create_timer(start_offset).timeout
		
	repeat()


func spawn():
	var spawned = obstacle.instantiate()
	get_parent().add_child(spawned)

	var spawn_pos = global_position
	spawned.global_position = spawn_pos


func repeat():
	spawn()
	await get_tree().create_timer(spawn_interval).timeout
	repeat()
