"""
The cursor moves left to right linearly, so as to show *when* to press the button, which it listens for. It then sends the appropriate score out.
"""
extends Node2D

var cursor: Node2D
#
var cursor_speed: float = 0.09
#
var t: float = 0.0
# lerp target
var next_target_position: Vector2 = Vector2(-30, -30)
var text:String = ""

@onready var score_text = preload("res://Scenes/score_text.tscn")

@onready var tick_player: AudioStreamPlayer = $"tick player"

@export var cursor_tscn: PackedScene

# physics moves the cursor left
	# read exactly what lerp-ing is
#func _physics_process(delta: float) -> void:
##increment needs to be v small -look up what it means exactly - the equation
	#t = t + (delta * self.cursor_speed)
	## linear interpolation is easier to musically predict
		## maybe allow for non-linear for comedic effect?	
	#self.cursor.position = self.cursor.position.lerp(self.next_target_position, t)
	
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.cursor = cursor_tscn.instantiate()
	self.add_child(cursor)
	
	#self.cursor.position.y = 100

# process listens only for button presses
func _process(delta: float) -> void:
	if not cursor.good_timer_stopped():
		if Input.is_action_just_pressed("button"):
			if not cursor.perfect_timer_stopped():
				Signals.inc_score.emit(20)
				text = "PERFECT"
			else:
				Signals.inc_score.emit(10)
				text = "GOOD"
				
			cursor.stop_good_timer()
			tick_player.play()
		
		#else:
			#text = "MISS"
		
		var st = score_text.instantiate()
		st.set_text_info(text)
		get_tree().root.call_deferred("add_child", st)
		st.position = cursor.position

# this slot for the 'last_orb_position' signal sets the lerp target co-ordinate
func next_target(next_coord: Vector2) -> void:
	print('this cursor is at:', cursor.position)
	self.next_target_position = next_coord
	print('the cursors target is at:', next_coord)
