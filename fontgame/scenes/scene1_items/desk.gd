extends Node2D

# yes this is where the entire cutscene is located. fuck you

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player = %CharacterBody2D
@onready var playersprite = %PlayerSprite
@onready var interaction_manager = get_node("/root/InteractionManager")

#
#@onready var text_box_scene = preload("res://interaction/text/textbox.tscn")
#var text_box
var plot_flag = 0



const lines: Array[String] = [
	"Your desk.",
	"It's time for class to begin."
]

const comic_lines: Array[String] = [
	#"...",
	#"Hello, everyone.",
	#"...",
	#"REFLECTION, huh?",
	#"Well, here's a REFLECTION about my life.",
	#"My whole gotdamn life.",
	#"Do you have any idea what it's like,",
	#"Having to spend your life in the shadow of someone you've never even heard of!?",
	#"\"Sans.\"",
	#"Every day I hear the same thing.",
	#"\"Are you Sans!?\"",
	#"\"Holy shit is that Sans!?\"",
	#"\"Sans Undertale!?\"",
	#"...",
	#"Who the fuck is \"Sans!?\"",
	#"Let me give you kids another REFLECTION.",
	#"Life isn't as easy as you think it is.",
	#"Even if your name is Comic Sans,",
	#"That does NOT mean you're going to have any success being a comedian.",
	#"See, that's been my goal. My whole life, all I've wanted was to entertain people!",
	#"And I tried. I've done it all - stand-up, cabaret, youtube...",
	#"But every damn time I come up on the stage and introduce myself, it's always the damn same!",
	#"\"SANS UNDERTALE\" this, \"SANS UNDERTALE\" that.",
	#"I've tried to build a name for myself, but nothing I ever did was enough.",
	#"Nothing I've ever done could free me from this burden.",
	#"Nothing...",
	#"...",
	#"So.",
	#"Word of advice for y'all kids.",
	#"If any of y'all have a dream...",
	#"A goal, something that you feel like is the true purpose of your life,",
	#"Take some time to REFLECT on it.",
	#"And maybe then you'll realise,",
	#"That sometimes the best thing to do is give up.",
	#"...",
	#"... Or at least change your name first.",
	#"Trust me. You don't want to end up like me.",
	#"Divorced, one kid in jail, no custody of the other.",
	#"Just because your wife thinks some... video game character is better than you.",
	#"... Well, maybe ignore that last part.",
	#"Point is, kids...",
	#"Never follow your dreams.",
	"It'll just end in heartbreak."
	]
	
const segoe_lines: Array[String] = [
	#"Hellooo Everybody!!!",
	#"My name is Segoe Print!!!",
	#"And I’m so, so, so, glad!",
	#"That I’ve been invited to speak with the other Fonts!",
	#"Now, today, I've got an important REFLECTION to share.",
	#"It's a REFLECTION about... boundaries!",
	#"And I know what you're thinking. Y-A-W-N!",
	#"But no! Boundaries are very important!",
	#"If you don’t know where they stand,",
	#"how will you know how to break them most effectively?!?!",
	#"Now, you may be asking yourselves! BuT SeGoe!!!! DoN’t We WanNa AvOiD ThAt!!?",
	#"Very good question!",
	#"No.",
	#"You wanna be avoiding how to get caught!",
	#"That’s where the trouble starts.",
	#"See, my ex, he used to mop up my mess!",
	#"And now, guess what!" ,
	#"...",
	#"GuEsS WhAt! - You should be saying \"what\" back, class!",
	#"Now he’s your school caretaker!",
	#"And I know what your thinking - Damn, Mr Finch Fucks?!?!!?",
	#"Well, he did. Until he decided I was taking things too far.",
	#"Y'know, espionage, blackmail, the fun stuff in life!",
	#"... he dumped me.",
	#"Well... At least... He thought he did, but in truth, we’ve been very close!",
	#"You see! A mere year ago, I was not merely a Segoe Print font.",
	#"I was Segoe Print Bold!",
	#"But I spent all year round working hard to lose the weight - and now look at me!",
	#"...",
	#"...",
	#"...",
	#"And you know what, he bought it!",
	#"I know what you're thinking. \"Oh, he took you back. Congratulations!\"",
	#"Oh, no, no, no! You're too naive, children!",
	#"First, I started taking classes at this school.",
	#"You know, the after-school college classes they offer. Didn’t interest me much --",
	#"I mean, I loved them! Of course I did, sillies! HAHAHAHAHA",
	#"HAHAHA... Haha... Ha...",
	#"...",
	#"After classes, however, was when the real fun would start!",
	#"Waiting.",
	#"Waiting...",
	#"Just waiting to see him go by.",
	#"Of course, I didn’t wanna be noticed.",
	#"Even with my change in appearance, he could still figure out who I am.",
	#"SO. I WAITED IN THE AIR VENTS.",
	#"Waited and waited - once I almost got spotted!",
	#"Cause when I went to leave, my bones cracked!",
	#"Guess I was sitting in one place too long, huh!",
	#"Wait, do fonts even have bones...?",
	#"... Anyways, I guess you're wondering what the point of this was, right?",
	#"...",
	#"... ... ...",
	#"Always...",
	#"Always believe in yourself...",
	#"Good things...",
	#"Come to...",
	#"those...",
	#"who...",
	"wait."
	]
	
const impact_lines: Array[String] = [
	"Hi, kids!",
	"It's so... great to meet all of you!",
	"Today, I'm going to talk about...",
	"I'm going to talk about...",
	"Uh... REFLECTION! Yeah!",
	"I am really great at that.",
	"When you've spent as many years as I have going to court-appointed anger management classes,",
	"You end up doing a lot of self-REFLECTION.",
	"You start to realise things about yourself.",
	"Like... Is my tendency to lash out rooted in toxic masculinity?",
	"Is toxic masculinity even a thing for a genderless personification of a font?",
	"And, most importantly,",
	"You start to realise that YOU are not the problem!",
	"The problem is EVERYONE ELSE!",
	"I didn't *want* to do anger management.",
	"In fact, I can manage myself just fine!",
	"Perfectly, even! I bet I can manage my emotions better than you all,",
	"hormonal, puberty-ridden, stinky band of disgusting TEENAGERS.",
	"I bet you're looking down at me right now, aren't you?",
	"\"Oh, look at this ugly old motherf!@$cker! Having to do a speech in front of a group of KIDS,",
	"JUST TO EARN THEIR 5-DAY ANGER MANAGEMENT CHIP,",
	"WHICH THEY WILL PROBABLY LOSE... AGAIN... AS SOON AS SOME...",
	"ANNOYING... CRYING BABY ON A PLANE...",
	"OR SOME OTHER SHIT BOTHERS THEM JUST A LITTLE BIT,",
	"AND THEN THEY'LL HAVE *ANOTHER* ARREST WARRANT,",
	"AND *ANOTHER* COURT CASE,",
	"AND *ANOTHER* RESTRAINING ORDER...\"",
	"YEAH, LET'S ALL POINT AND LAUGH AT THIS SAD SON OF A BITCH!",
	"HAHAHAHAHAHAHAHAHAHAHAHAHA! HAHAHAHAHA! HAHAHA, AM I RIGHT?",
	"IT'S SO FUNNY SEEING THEM LASH OUT,",
	"JUST BECAUSE NOBODY TAKES THEM SERIOUSLY,",
	"JUST BECAUSE THEIR MUM DIDN'T HOLD THEM ENOUGH AS A CHILD,",
	"BECAUSE THEY DIDN'T KNOW HOW TO IMPLEMENT WHITE TEXT WITH A BLACK OUTLINE,",
	"IN A GAME THEY ONLY HAD 7 DAYS TO MAKE!!!!",
	"HAHAHA! WHAT A PATHETIC LOSER, RIGHT?",
	"Well. GUESS WHAT!",
	"WITH ANY LUCK, YOU ALL ARE GOING TO END UP EXACTLY LIKE ME.",
	"BECAUSE ANGER MANAGEMENT IS. A. JOKE.",
	"\"OhH, IMPACT, YoU ShOULdn'T SpEaK YoUr MiNd SO OpEnLY!\"",
	"\"YoU MiGhT HuRt SoMeOnE's FeELiNgS!\"",
	"OH SHUT THE F!@$ UP!",
	"I DON'T CARE ABOUT YOUR FEELINGS.",
	"HAS ANYONE EVER CARED ABOUT MINE!?",
	"...",
	"*SOB*",
	"...",
	"WHAT ARE YOU STARING AT ME FOR!?",
	"CLASS IS OVER. GO F!@$CK YOURSELVES."
	]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	
	DialogueManager.start_dialogue(global_position, lines)
	await DialogueManager.dialogue_finished
	%desk_CollisionShape2D.disabled = true
	player.global_position.x = 475.0
	player.global_position.y = 783.0
	interaction_manager.player_can_move = false
	playersprite.texture = load("res://images/sprites/player/back static.png") #this doesn't work for some reason but whatever
	
	if GlobalSettings.plot_flag == 0:
		cutscene_1()
	elif GlobalSettings.plot_flag == 1:
		cutscene_2()
	elif GlobalSettings.plot_flag == 2:
		cutscene_3()
		
	GlobalSettings.currentfont = "consolas"
	#interaction_manager.player_can_move = true #return player movement
	#%desk_CollisionShape2D.disabled = false
	%comic_CollisionShape2D.disabled = false #allow player to talk to font
	%chalkboard_CollisionShape2D.disabled = false #allow player to interact with board
	
func cutscene_1():

	%comic.visible = true
	%AnimatedSprite2D.animation = "default"
	%comic_AnimationPlayer.play("RESET")
	%comic_AnimationPlayer.play("enter")
	await %comic_AnimationPlayer.animation_finished
	
	GlobalSettings.currentfont = "comic"
	DialogueManager.start_dialogue(global_position, comic_lines)
	
	await DialogueManager.dialogue_finished
	GlobalSettings.plot_flag = 1
	#interaction_manager.player_can_move = true #return player movement

	
func cutscene_2():

	%AnimatedSprite2D.animation = "segoe"
	%comic.visible = true
	%comic_AnimationPlayer.play("RESET")
	%comic_AnimationPlayer.play("enter")
	await %comic_AnimationPlayer.animation_finished
	
	GlobalSettings.currentfont = "segoe"
	DialogueManager.start_dialogue(global_position, segoe_lines)
	
	await DialogueManager.dialogue_finished
	GlobalSettings.plot_flag = 2
	
func cutscene_3():

	%AnimatedSprite2D.animation = "impact"
	%comic.visible = true
	%comic_AnimationPlayer.play("RESET")
	%comic_AnimationPlayer.play("enter")
	await %comic_AnimationPlayer.animation_finished
	
	GlobalSettings.currentfont = "impact"
	DialogueManager.start_dialogue(global_position, impact_lines)
	
	await DialogueManager.dialogue_finished
	GlobalSettings.plot_flag = 3
