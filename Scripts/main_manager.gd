"""
Main node holds all the other nodes by virtue of holding the MIDI player (which instantiates the target and cursor makers, which in turn instantiate everything else). 
This is the rhythm game manager - decides when to start, how to start, which nodes it *directly* creates and manages. In short, it manages settings global to the rhythm game.
"""
	#should probably implement some sort of singleton pattern check
extends Node2D

@export var audio_manager_tscn: PackedScene

func _ready() -> void:
	var audio_manager = audio_manager_tscn.instantiate()
	self.add_child(audio_manager)


func _process(delta: float) -> void:
	# for now, the manager doesn't need to do anything other than start things.
	pass
