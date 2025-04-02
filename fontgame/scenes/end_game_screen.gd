extends Node

var score_placeholder = 9999999999
var score_placeholder_string = str(score_placeholder)
var lines: Array[String] = [
	"And just like that,",
	"You have helped the fonts REFLECT on themselves.",
	"Your score was:",
	score_placeholder_string,
	"CONGRATULATIONS!!!"
]

func on_end_game():
	$ColorRect.visible = true
	DialogueManager.start_dialogue(%CharacterBody2D.global_position, lines)
	await DialogueManager.dialogue_finished
	get_tree().quit()
