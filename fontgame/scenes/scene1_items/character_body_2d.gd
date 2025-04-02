extends CharacterBody2D
@onready var animation = $AnimationPlayer
@onready var lastturn:String
@export var speed = 300
@onready var interact_square = $Square
@onready var collisionshape = $CollisionShape
#@onready var cutscene = false
@onready var interaction_manager = get_node("/root/InteractionManager")



func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed


func _physics_process(delta):
	if interaction_manager.player_can_move == true:
		get_input()
		move_and_slide()
		if global_position.y < 225:
			global_position.y = 225
		elif global_position.y > 850:
			global_position.y = 850
		if global_position.x < 210:
			global_position.x = 210
		elif global_position.x > 1710:
			global_position.x = 1710


func _process(delta: float) -> void:
	var left = Input.is_action_pressed("left")
	var right = Input.is_action_pressed("right")
	var up = Input.is_action_pressed("up")
	var down = Input.is_action_pressed("down")

	
	if down:
		lastturn = "down"
		animation.play("walk front")
	elif up:
		lastturn = "up"
		animation.play("walk up")
	elif left:
		lastturn = "left"
		animation.play("walk left")
	elif right:
		lastturn = "right"
		animation.play("walk right")
	else:
		animation.stop()
		if lastturn == "down":
			animation.play("RESET")
		elif lastturn == "up":
			$PlayerSprite.texture = load("res://images/sprites/player/back static.png")
		elif lastturn == "left":
			$PlayerSprite.texture = load("res://images/sprites/player/side static.png")
		elif lastturn == "right":
			$PlayerSprite.texture = load("res://images/sprites/player/right static.png")
	
	##code for interacting with things
	
#func _inter():
			
				
			
	
