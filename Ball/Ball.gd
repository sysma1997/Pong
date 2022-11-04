extends KinematicBody2D

signal updatePos(y)

export var speed: int = 0

enum {
	LEFT, 
	RIGHT, 
	UP, 
	DOWN
}

var direction: Vector2
var last_direction: Vector2
var random = RandomNumberGenerator.new()

func _ready():
	start()

func _physics_process(delta):
	direction = direction.normalized() * (200 + speed) * delta
	var collision = move_and_collide(direction)
	emit_signal("updatePos", position.y)
	
	if collision:
		var reflect = collision.remainder.bounce(collision.normal)
		direction = direction.bounce(collision.normal)
		
		var angle = last_direction.normalized().dot(direction.normalized())
		print(angle) # if angle > 0.90 or angle < -0.90
		
		last_direction = direction
		move_and_collide(reflect)

func _on_Game_outTable():
	start()

func _on_Interface_play():
	start()

func start():
	speed = 0
	position = Vector2(380, 252)
	direction = Vector2(0, 0)
	random.randomize()
	var leftRight = random.randi_range(0, 1)
	random.randomize()
	var upDown = random.randi_range(2, 3)
	
	if leftRight == LEFT:
		direction.x -= 1
	else: 
		direction.x += 1
	if upDown == UP: 
		direction.y -= 1
	else:
		direction.y += 1

func _on_Timer_timeout():
	speed += 15
