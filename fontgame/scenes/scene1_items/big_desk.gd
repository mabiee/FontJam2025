extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
#@onready var sprite = $Icon

const lines: Array[String] = [
	"Teacher's desk.",
	"Covered in all sorts of teaching materials about fonts."
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	DialogueManager.start_dialogue(global_position, lines)
	await DialogueManager.dialogue_finished
	
	
