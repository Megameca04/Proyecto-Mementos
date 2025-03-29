extends CharacterBody2D

@export var speed : float = 300.0

var direction : Vector2

func _process(_delta: float) -> void:
	if direction.x < 0:
		$AnimatedSprite2D.play("Left")
	elif direction.x > 0:
		$AnimatedSprite2D.play("Rigth")
	
	if direction.y < 0:
		$AnimatedSprite2D.play("Up")
	elif direction.y > 0:
		$AnimatedSprite2D.play("Down")
	
	if direction == Vector2.ZERO:
		$AnimatedSprite2D.play("Idle")

func _physics_process(_delta: float) -> void:
	
	direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	
	if direction:
		velocity = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed/2)
		velocity.y = move_toward(velocity.y, 0, speed/2)
	
	move_and_slide()
