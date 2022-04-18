extends Control

func _on_Start_button_down():
	Global.goto_scene("res://Game.tscn")
func _on_Exit_button_down():
	get_tree().quit()
