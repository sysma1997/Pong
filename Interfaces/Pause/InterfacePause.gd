extends Control

signal continueGame
signal exitGame

func _on_Continue_button_down():
	emit_signal("continueGame")
func _on_Exit_button_down():
	emit_signal("exitGame")
