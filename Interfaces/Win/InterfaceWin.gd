extends Control

signal playGame
signal exitGame

func _on_Interface_winner(title):
	$PanelContainer/VBoxContainer/title.text = title

func _on_Play_button_down():
	emit_signal("playGame")

func _on_Exit_button_down():
	emit_signal("exitGame")
