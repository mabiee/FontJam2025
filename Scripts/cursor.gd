"""
The cursor will be responsive for it's animations
"""
extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.x+=1
	
func good_timer_stopped():
	return $"good area/good timer".is_stopped()
	
func perfect_timer_stopped():
	return $"perfect area/perfect timer".is_stopped()

func stop_good_timer():
	$"good area/good timer".stop()
