extends Area2D

@export var speed: float = 300.0

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	
func _physics_process(delta):
	position.x -= speed * delta
	if position.x < -get_viewport().size.x - 750:
		queue_free()

func _on_body_entered(body):
	if body is CharacterBody2D:
		body.queue_free()
