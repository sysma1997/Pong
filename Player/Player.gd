extends KinematicBody2D

export var speed = 15000
var screen_size
var limit_up
var limit_down

func _ready():
	screen_size = get_viewport().size
	var size = $Sprite.texture.get_size().y / 2
	limit_up = size
	limit_down = screen_size.y - size

func _physics_process(delta):
	var velocity = get_input(delta)
	velocity.x = 0
	
	if position.x > 728:
		velocity.x -= 1
	
	velocity = move_and_slide(velocity)

func get_input(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	
	velocity = (velocity.normalized() * speed) * delta
	
	return velocity

func _on_Ball_moreSpeedPlayer():
	speed += 200

func _on_Game_outTable():
	speed = 15000
