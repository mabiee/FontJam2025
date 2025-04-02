extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
#@onready var sprite = $Icon

const lines: Array[String] = [
	"Posters on the wall are inviting you to study fonts.",
	"It seems like these have been hanging here for a long time."
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	DialogueManager.start_dialogue(global_position, lines)
	await DialogueManager.dialogue_finished
	
	
