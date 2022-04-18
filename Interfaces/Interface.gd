extends Control

signal pause(isPause)
signal exit

var pointPlayer: int = 0
var pointOpponent: int = 0

var isPause: bool

func _ready():
	isPause = false

func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		if !isPause:
			emit_signal("pause", true)
			$Pause.visible = true
		elif isPause:
			emit_signal("pause", false)
			$Pause.visible = false
		isPause = !isPause

func _on_Game_pointPlayer():
	pointPlayer += 1
	$PointPlayer.text = String(pointPlayer)

func _on_Game_pointOpponent():
	pointOpponent += 1
	$PointOpponent.text = String(pointOpponent)


func _on_Pause_continueGame():
	emit_signal("pause", false)
	$Pause.visible = false
	isPause = !isPause
func _on_Pause_exitGame():
	emit_signal("exit")
