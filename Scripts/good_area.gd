"""
This area, once it overlaps with a target area, begins the 'good' timer (a longer timer than the 'perfect' timer), indicating how long the player has to press the button and receive a 'good' amount of points.
"""
extends Area2D

# this slot for the '_on_area_entered' signal (of this very area2D) begins the 'good' timer for how long the player can press the button and receive a 'good' score
func good_area_entered(area: Area2D) -> void:
	print('good area start')
	$"good timer".start(1)
