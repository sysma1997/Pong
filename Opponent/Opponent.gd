extends KinematicBody2D

signal racketTouch

export var speed = 10000
var screen_size
var limit_up
var limit_down

var velocity: Vector2 = Vector2(0, 0)

func _ready():
	screen_size = get_viewport().size
	var size = $Sprite.texture.get_size().y / 2
	limit_up = size
	limit_down = screen_size.y - size

func _physics_process(delta):
	velocity = (velocity.normalized() * speed) * delta
	
	velocity = move_and_slide(velocity)
	position.y = clamp(position.y, limit_up, limit_down)

func _on_Area2D_body_entered(body):
	emit_signal("racketTouch")

func _on_Ball_updatePos(y):
	velocity.y = y
