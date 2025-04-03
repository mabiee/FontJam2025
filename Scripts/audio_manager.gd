"""
Script for the MIDI player manager. Instantiates the target maker, receives and sends signals from the MIDI player.
"""
	#should probably implement some sort of singleton pattern check
extends Node2D

# the target marker is used in multiple functions, so it's created as a member function
var dots_manager
var capture_set = randi_range(1,5)
var counter_x = 0
var counter_y = 0
@export var dots_manager_tscn: PackedScene
@onready var midi_player: MidiPlayer = $MidiPlayer

var keys = [9, 16, 27, 43, 50, 64, 78, 81, 91, 109, 111, 115, 124, 129, 131, 134, 134, 137, 143, 144, 147, 151, 156, 158, 161, 164, 165, 170, 174, 181, 183, 185, 189, 192, 211, 218, 221, 225, 226, 227, 228, 229, 234, 238, 238, 240, 241, 242, 247, 247, 252, 254, 257, 261, 267, 269, 274, 274, 275, 279, 280, 284, 288, 293, 293, 295, 297, 301, 301, 302, 306, 307, 309, 312, 315, 316, 320, 321, 322, 324, 326, 328, 330, 330, 335, 339, 339, 340, 343, 346, 348, 349, 350, 350, 352, 353, 353, 356, 357, 357, 357, 360, 362, 364, 364, 366, 367, 371, 371, 375, 376, 377, 380, 380, 381, 384, 384, 388, 389, 398, 401, 403, 404, 405, 407, 408, 408, 412, 417, 417, 418, 422, 425, 425, 429, 430, 430, 432, 432, 434, 439, 440, 444, 444, 446, 448, 449, 453, 455, 456, 457, 459, 460, 460, 460, 461, 463, 463, 466, 467, 470, 471, 472, 473, 476, 480, 483, 484, 485, 487, 489, 489, 494, 498, 499, 501, 501, 503, 504, 508, 510, 512, 513, 514, 515, 517, 517, 518, 521, 521, 521, 521, 525, 526, 535, 538, 540, 540, 542, 542, 543, 543, 545, 547, 547, 549, 550, 556, 558, 559, 563, 565, 567, 568, 568, 569, 571, 572, 573, 576, 577, 580, 581, 583, 585, 590, 590, 593, 594, 595, 597, 599, 600, 600, 602, 603, 604, 604, 608, 609, 609, 610, 610, 613, 613, 614, 617, 617, 622, 622, 624, 627, 627, 627, 628, 631, 634, 636, 638, 640, 641, 645, 648, 649, 650, 652, 653, 655, 657, 659, 662, 664, 664, 665, 665, 668, 669, 672, 675, 677, 677, 679, 681, 683, 685, 686, 686, 689, 690, 691, 693, 695, 696, 699, 703, 704, 705, 705, 706, 709, 710, 710, 712, 713, 718, 718, 719, 720, 720, 723, 724, 727, 730, 731, 732, 734, 734, 736, 737, 740, 741, 741, 744, 746, 746, 747, 747, 751, 751, 754, 759, 759, 761, 763, 764, 765, 767, 768, 768, 774, 775, 778, 782, 782, 785, 785, 787, 788, 789, 789, 791, 791, 792, 795, 796, 799, 801, 801, 803, 806, 809, 813, 814, 816, 816, 816, 819, 820, 822, 823, 823, 823, 827, 828, 828, 830, 830, 832, 833, 837, 839, 841, 842, 843, 844, 846, 847, 850, 850, 850, 854, 857, 857, 860, 861, 864, 868, 868, 869, 869, 871, 872, 876]
var current_note = keys.pop_front()
	#look up how the scene tree loads
func _ready() -> void:
	self.dots_manager = dots_manager_tscn.instantiate() 
	self.add_child(self.dots_manager)
	
	for key in keys:
		if counter_y > 7:
			counter_x+=1
			counter_y = 0
		var get_note = randi_range(1,5)
		if get_note > 4:
			self.dots_manager.make_notes(Vector2(counter_x, counter_y))
			print(Vector2(counter_x, counter_y))
			counter_y+=1
		
# Listens for two MIDI events - 'note_on' and 'note_off'
# 'note_on' is used to move the target maker's cursor
# 'note_off' is used to time the creation of new targets
func _on_midi_event( channel, event ):
	var beat = int(midi_player.position/midi_player.tempo)
	if (event.type == 144 or event.type == 128):
		pass
		#self.dots_manager.calculate_range(event)
		#var get_note = randi_range(1,5)
		#if (event.type == 128):
			#if(counter < capture_set) and (get_note > 2):
			##if Input.is_action_just_pressed("button"):
				#keys.append(beat)
				#self.dots_manager.target_maker.draw_note(Vector2(beat,capture_set))
				#print('beat is: ', beat)
				#print('keys are:', keys)
				#counter = counter + 1
			#else:
				#capture_set = randi_range(1,5)
				#counter = 0
		
func _process(delta: float) -> void:
	pass
	#var beat = int(midi_player.position/midi_player.tempo)
	#if beat == current_note:
		#current_note = keys.pop_front()
		
		
		
		
		#dots_manager.cursor_maker.tick_player.play()
	#if Input.is_action_just_pressed("button"):
		#keys.append(int(midi_player.position/midi_player.tempo))
	#if not midi_player.playing:
		#print(keys)
