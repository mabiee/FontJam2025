"""
This area, once it overlaps with a target area, begins the 'perfect' timer (a shorter timer than the 'good' timer), indicating how long the player has to press the button and receive a 'perfect' amount of points.
"""
extends Area2D

# this slot for the '_on_area_entered' signal (of this very area2D) begins the 'perfect' timer for how long the player can press the button and receive a 'perfect' score
func perfect_area_entered(area: Area2D) -> void:
	#print('perfect area start')
	$"perfect timer".start(0.5)
