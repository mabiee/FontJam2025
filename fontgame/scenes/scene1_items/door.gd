extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
#@onready var sprite = $Icon
#@onready var player = $CharacterBody2D

const lines: Array[String] = [
	"The door.",
	"Class is in. You can't leave."
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	DialogueManager.start_dialogue(global_position, lines)
	await DialogueManager.dialogue_finished
	
	
	
