extends Control

signal continueGame
signal exitGame

var btnContinue: Button
var btnExit: Button

func _ready():
	btnContinue = $PanelContainer/VBoxContainer/Continue
	btnExit = $PanelContainer/VBoxContainer/Exit

func _on_Continue_button_down():
	emit_signal("continueGame")
func _on_Exit_button_down():
	emit_signal("exitGame")
