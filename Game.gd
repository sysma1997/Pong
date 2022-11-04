extends Node2D

signal touchUp
signal touchDown

signal outTable
signal pointPlayer
signal pointOpponent

func _on_Up_body_entered(body):
	print(body.name)
	emit_signal("touchUp")
func _on_Down_body_entered(body):
	emit_signal("touchDown")

func _on_Table_body_exited(body):
	var point = body.position.x
	if point > 0: 
		emit_signal("pointOpponent")
	else:
		emit_signal("pointPlayer")
	
	emit_signal("outTable")

func _on_Interface_pause(isPause):
	if isPause:
		get_tree().paused = true
	else:
		get_tree().paused = false
func _on_Interface_exit():
	get_tree().paused = false
	Global.goto_scene("res://App.tscn")

func _on_Interface_winner(title):
	get_tree().paused = true
func _on_Interface_play():
	get_tree().paused = false
