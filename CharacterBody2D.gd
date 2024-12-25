extends CharacterBody2D

const JUMP_VELOCITY = -500.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var touch_pressed = false

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed():
			touch_pressed = true
		else:
			touch_pressed = false
	elif event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			touch_pressed = true
		else:
			touch_pressed = false

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") || touch_pressed:
		velocity.y = JUMP_VELOCITY

	move_and_slide()
