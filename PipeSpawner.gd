extends Node2D

@export var pipe: PackedScene
@export var gap_size: float = 930.0 
var spawn_timer = 0.0
const SPAWN_INTERVAL = 1.3

func _physics_process(delta):
	spawn_timer += delta
	if spawn_timer >= SPAWN_INTERVAL:
		spawn_pipe_pair()
		spawn_timer = 0.0

func spawn_pipe_pair():
	var pipe1 = pipe.instantiate()
	add_child(pipe1)
	pipe1.position.y = randf_range(100, 550)

	var pipe2 = pipe.instantiate()
	add_child(pipe2)
	pipe2.position.y = pipe1.position.y - gap_size
	pipe2.scale.y = -1 
