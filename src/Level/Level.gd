extends Node

var PlayerScore = 0
var OpponentScore = 0

var velocity = Vector2.ZERO

func _ready() -> void:
	get_tree().call_group('BallGroup','stop_ball')
	$Timer.start()



func _on_Left_body_entered(body: Node) -> void:
	print('LOSE')
	OpponentScore += 1
	score_achieved()

func _on_Right_body_entered(body: Node) -> void:
	print('WIN')
	PlayerScore += 1
	score_achieved()

func score_achieved():
	$Ball.position = Vector2(640,360)
	$Opponent.position.x = $Opponent.position.x
	$Player.position.x = $Player.position.x
	get_tree().call_group('BallGroup','stop_ball')
	$CountdownLabel.visible = true
	$Timer.start()
	$ScoreSound.play()
	
func _process(delta: float) -> void:
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)
	$CountdownLabel.text = str(int($Timer.time_left) +1)


func _on_Timer_timeout() -> void:
	get_tree().call_group('BallGroup','restart_ball')
	$CountdownLabel.visible = false
	$TimeOutSound.play()
	$"Score title".visible = true
	$PlayerScore.visible = true
	$OpponentScore.visible = true
