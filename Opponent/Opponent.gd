extends KinematicBody2D

export var speed: int = 10000

var velocity: Vector2 = Vector2(0, 0)

func _physics_process(delta):
	velocity = (velocity.normalized() * speed) * delta
	velocity.x = 0
	
	if position.x < 32:
		velocity.x += 1
	
	velocity = move_and_slide(velocity)

func _on_Ball_updatePos(y):
	var result = position.y - y
	if result > 0:
		velocity.y = -1
	else:
		velocity.y = 1
	
	speed += result / 2
