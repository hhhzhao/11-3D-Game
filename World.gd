extends Spatial

onready var Score = $HUD/Score
onready var Lives = $HUD/Lives
onready var Remaining = $HUD/Remaining
var score = 0
var time_remaining = 180

func _unhandled_input(event):
	if Input.is_action_pressed("quit"):
		get_tree().quit()

func add_score(s):
	score += s
	Score.text = str(score)
	if score == 110:
		get_tree().change_scene("res://Scene/win.tscn")
	

func _on_Countdown_timeout():
	time_remaining -=1
	if time_remaining <= 0:
		get_tree().change_scene("res://Scene/GameOver.tscn")
	else:
		var m = time_remaining / 60
		var s = time_remaining % 60
		Remaining.text = str(m)+":"+str(s)
