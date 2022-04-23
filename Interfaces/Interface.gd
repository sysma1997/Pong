extends Control

signal pause(isPause)
signal exit
signal play
signal winner(title)

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
	compareWinner()

func _on_Game_pointOpponent():
	pointOpponent += 1
	$PointOpponent.text = String(pointOpponent)
	compareWinner()

func _on_Pause_continueGame():
	emit_signal("pause", false)
	$Pause.visible = false
	isPause = !isPause
func _on_Pause_exitGame():
	emit_signal("exit")

func _on_Win_playGame():
	pointPlayer = 0
	pointOpponent = 0
	$PointOpponent.text = "0"
	$PointPlayer.text = "0"
	$Win.visible = false
	emit_signal("play")
func _on_Win_exitGame():
	emit_signal("exit")

func compareWinner():
	var pointToWin = 10
	if pointPlayer == pointToWin:
		passWinner("You win")
	elif pointOpponent == pointToWin:
		passWinner("You lost")
func passWinner(title):
	emit_signal("winner", title)
	$Win.visible = true
