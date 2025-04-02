extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea

const lines: Array[String] = [
	"i'm Segoe Print"
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	GlobalSettings.currentfont = "segoe"
	
	DialogueManager.start_dialogue(global_position, lines)
	await DialogueManager.dialogue_finished
	
	GlobalSettings.currentfont = "consolas"

	
