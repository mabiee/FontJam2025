extends Control

var score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Signals.inc_score.connect(inc_score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func inc_score(incr: int) -> void:
	score += incr
	$CanvasLayer/scorelabel.text = str(score) + 'pts'
	print(Signals.send_score(score))
