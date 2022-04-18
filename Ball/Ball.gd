extends KinematicBody2D

signal updatePos(y)

export var speed = 15000

enum {
	LEFT, 
	RIGHT, 
	UP, 
	DOWN
}

var direction: Vector2
var random = RandomNumberGenerator.new()

var touch: int = 1

func _ready():
	start()

func _physics_process(delta):
	direction = (direction.normalized() * speed) * delta
	direction = move_and_slide(direction)
	emit_signal("updatePos", direction.y)

func _on_Game_touchUp():
	direction.y *= -1
func _on_Game_touchDown():
	direction.y *= -1

func _on_Player_racketTouch():
	direction.x *= -1
	
	touch += 1
	if touch > 5:
		moreSpeed()
func _on_Opponent_racketTouch():
	direction.x *= -1
	
	touch += 1
	if touch > 5:
		moreSpeed()

func _on_Game_outTable():
	start()

func start():
	speed = 15000
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
func moreSpeed():
	speed += 5000
	touch = 1
