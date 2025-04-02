extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	print ("This will trigger the rhythm minigame.")
	GlobalSettings.drawings_finished = true
	%chalkboard_CollisionShape2D.disabled = true
	
