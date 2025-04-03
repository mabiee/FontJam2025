"""
 
"""

#never load the current target, only the next one
extends Node2D

var target_column_width: int = 70
var target_column_offset: int = 50
var target_column_lower: int = 1
var target_column_upper: int = target_column_width

var repetitions: int = 0

var next_coord: Vector2 = Vector2.ZERO
var last_coord: Vector2 = Vector2.ZERO

var target_maker: Node2D
var cursor_maker: Node2D

var eaten:bool = false

signal last_orb_position(position: Vector2)

@export var target_maker_tscn: PackedScene
@export var cursor_maker_tscn: PackedScene

func make_notes(pos):
	self.target_maker.draw_note(pos)

func calculate_range(event):
	if repetitions == 32:
		self.target_column_upper += target_column_offset
		self.target_column_lower += target_column_offset
		repetitions = 0
	
	self.next_coord.x = randi_range(self.target_column_lower, self.target_column_upper)
	self.next_coord.y = randi() % int(get_viewport_rect().size.y)
	
	
	
	
	if(event.type == SMF.MIDIEventType.note_on):
		if(event.note==41):
			self.target_maker.draw_target(next_coord)
			if eaten:
				self.cursor_maker.next_target(next_coord)
				print('last coord is: ', last_coord)
			else:
				eaten = true
	
	last_coord = next_coord
			
	repetitions += 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.target_maker = target_maker_tscn.instantiate()
	self.add_child(target_maker)
	
	self.cursor_maker = cursor_maker_tscn.instantiate()
	self.add_child(cursor_maker)
