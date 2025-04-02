extends Node2D

# yes this is where the entire cutscene is located. fuck you

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player = %CharacterBody2D
@onready var playersprite = %PlayerSprite
@onready var interaction_manager = get_node("/root/InteractionManager")

#@onready var text_box_scene = preload("res://interaction/text/textbox.tscn")
#var text_box
var watched_cutscene = false

const lines: Array[String] = [
	"Your sketchbook.",
	"It's time for the second guest of the day to arrive."
]

const comic_lines: Array[String] = [
	"Segoe script ",
	"I mean print"
	]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	
	if watched_cutscene == false:
		pass
	elif watched_cutscene == true:
		print("Cutscene has already been seen.")
		return
		
	
	DialogueManager.start_dialogue(global_position, lines)
	await DialogueManager.dialogue_finished
	#interaction_manager.can_interact = false
	%CollisionShape2D.disabled = true
	player.global_position.x = 475.0
	player.global_position.y = 783.0
	interaction_manager.player_can_move = false
	playersprite.texture = load("res://images/sprites/player/back static.png") #this doesn't work for some reason but whatever
	
	cutscene_1()
	watched_cutscene = true #flag that the cutscene has already been seen.
	
	
func cutscene_1():

	%segoe.visible = true
	%segoe_AnimationPlayer.play("enter")
	await %segoe_AnimationPlayer.animation_finished
	
	GlobalSettings.currentfont = "segoe"
	DialogueManager.start_dialogue(global_position, comic_lines)
	
	await DialogueManager.dialogue_finished
	GlobalSettings.currentfont = "consolas"


	interaction_manager.player_can_move = true
	%CollisionShape2D.disabled = false
	%segoe_CollisionShape2D.disabled = false
	
