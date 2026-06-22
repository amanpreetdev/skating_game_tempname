extends CharacterBody2D

@export var max_speed = 400.0
@export var acceleration = 800.0
@export var friction = 200.0

func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1

	if Input.is_action_pressed("ui_left"):
		direction.x -= 1

	if Input.is_action_pressed("ui_down"):
		direction.y += 1

	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	direction = direction.normalized()

	if direction != Vector2.ZERO:
		velocity += direction * acceleration * delta

		if velocity.length() > max_speed:
			velocity = velocity.normalized() * max_speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	move_and_slide()
