extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea

const lines_comic_beforedraw: Array[String] = [
	"What...?",
	"...An autograph?",
	"A-are you serious? I've never had...",
	"...",
	"Wait.",
	"I'M NOT SANS UNDERTALE!!!"
]

const lines_comic_afterdraw: Array[String] = [
	"Wait... is that...",
	"Did you draw that... for me?",
	"Wow...",
	"And not a single skeleton in sight...!",
	"This is the nicest thing anyone has ever done for me!",
	"I think...",
	"I think, maybe not all dreams are worth giving up on.",
	"I...",
	"I should call my wife."
]

const lines_segoe_beforedraw: Array[String] = [
	"Ohhh! Are you here to ask me a question?",
	"Ask away! Whaddya wanna know?",
	"Wait! Don't tell me!",
	"Ya got someone you LIKE like, don't you?",
	"And you wanna know from the EXPERT!",
	"How to make them love you,",
	"How to make them notice you,",
	"How to make them NOT notice you when you're getting to know them!",
	"Well, I happen to know all about that!",
	"So allow me to educate you!"
]

const lines_segoe_afterdraw: Array[String] = [
	"A... a painting...? For me...?",
	"That's... that's...",
	"I-I d-d-d-don't know what to say...!",
	"I... I think I...!",
	"I l....",
	"(No! Segoe! Too soon! You'll scare them away again!)",
	"(A-and besides, they're just a kid...!)",
	"I... IHAVETOGOBYE!!!",
	"A-and...! Um... Don't close your windows when you go to bed tonight!",
	"W-why? Umm... No reason! HAHAHA! HAHAHAHAHAHHAHAHAHHAHHAH"
]

const lines_impact_beforedraw: Array[String] = [
	"Impact lines before drawing."
]

const lines_impact_afterdraw: Array[String] = [
	"Impact lines after drawing."
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	
	if GlobalSettings.plot_flag == 1 && GlobalSettings.drawings_finished == false:
		
		GlobalSettings.currentfont = "comic"
		DialogueManager.start_dialogue(global_position, lines_comic_beforedraw)
		await DialogueManager.dialogue_finished
		GlobalSettings.currentfont = "consolas"
		
	elif GlobalSettings.plot_flag == 1 && GlobalSettings.drawings_finished == true:
		GlobalSettings.currentfont = "comic"
		DialogueManager.start_dialogue(global_position, lines_comic_afterdraw)
		await DialogueManager.dialogue_finished
		GlobalSettings.currentfont = "consolas"		
		disappear()
		GlobalSettings.drawings_finished = false
		#await %comic_AnimationPlayer.animation_finished

############# flag 2

	elif GlobalSettings.plot_flag == 2 && GlobalSettings.drawings_finished == false:
		GlobalSettings.currentfont = "segoe"
		DialogueManager.start_dialogue(global_position, lines_segoe_beforedraw)
		await DialogueManager.dialogue_finished
		GlobalSettings.currentfont = "consolas"		
	
	elif GlobalSettings.plot_flag == 2 && GlobalSettings.drawings_finished == true:
		GlobalSettings.currentfont = "segoe"
		DialogueManager.start_dialogue(global_position, lines_segoe_afterdraw)
		await DialogueManager.dialogue_finished
		GlobalSettings.currentfont = "consolas"	
		disappear()
		GlobalSettings.drawings_finished = false


############# flag 3

	elif GlobalSettings.plot_flag == 3 && GlobalSettings.drawings_finished == false:
		GlobalSettings.currentfont = "impact"
		DialogueManager.start_dialogue(global_position, lines_impact_beforedraw)
		await DialogueManager.dialogue_finished
		GlobalSettings.currentfont = "consolas"	
		
	elif GlobalSettings.plot_flag == 3 && GlobalSettings.drawings_finished == true:
		GlobalSettings.currentfont = "impact"
		DialogueManager.start_dialogue(global_position, lines_impact_afterdraw)
		await DialogueManager.dialogue_finished
		GlobalSettings.currentfont = "consolas"	
		disappear()
		GlobalSettings.drawings_finished = false
		await %comic_AnimationPlayer.animation_finished
		%end.on_end_game()

		
	else:
		print("error. plot_flag = ")
		print(GlobalSettings.plot_flag)
		print(" , drawings_finished = ")
		print(GlobalSettings.drawings_finished)
		
	## at the end of the long line of ifs....

func disappear():
	%comic_AnimationPlayer.play("leave")
	#%comic.visible = false
	%comic_CollisionShape2D.disabled = true	
	%desk_CollisionShape2D.disabled = false
	
