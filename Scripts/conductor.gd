# AudioStreamPlayer isn't localised
extends AudioStreamPlayer

# midi = 120bpm
# mp3 = 140bpm

# maybe use a list of target pos in groups for where to spawn them - like [1st, 3rd, 1st, 3rd, 4th, 4th, 4th] repeat

# how the game keeps track of time - very important to be exact - need to use bpm reader
# or make a bpm measurer using fft
@export var bpm := 145
# might need a list for songs w/ variable measurs
@export var measures := 4 

#Tracking the beat and song position
# accurate to ms
var song_position = 0.0
var song_beat_position = 1
var seconds_per_beat: float
var last_reported_beat = 0
# each song would need silence added to beginning
var beats_before_start = 0
var measure = 1
#tracking how close to the beat an even is
var closest = 0
var time_off_beat = 0.0

#signals song position in beats
signal beat(position)
#signals measure position in each beat group
signal measure_signal(position)

func _ready():
	self.seconds_per_beat = 60.0/bpm

# keep track of beat position
func _physics_process(delta: float) -> void:
	if self.playing:
		# audio is processed in chunks, hence playback position not being enough
		self.song_position = get_playback_position() + AudioServer.get_time_since_last_mix()
		# latency is the delay from godot sending the audio out to it being output
		self.song_position = self.song_position - AudioServer.get_output_latency()
		# where player is in seconds / no of beats in a second - floor division because beats are discrete
		# int casting because floor division gives a float - then add pre-play offset
		self.song_beat_position = int(floor(self.song_position / self.seconds_per_beat)) + self.beats_before_start
		_report_beat()

# signals what beat player is in
func _report_beat():
	# this means we're processing a new beat
	if self.last_reported_beat < self.song_beat_position:
		# could replace this if with a mod calculation ==> measure = (measure % measures) + 1
		if self.measure > self.measures:
			self.measure = 1
		emit_signal("beat", self.song_beat_position)
		emit_signal("measure_signal", self.measure)
		self.last_reported_beat = self.song_beat_position
		self.measure += 1
		
# allows targets to display before song starts
# offset is included in major equations - baked into conductor to be called from outside
func play_with_beat_offset(num):
	self.beats_before_start = num
	$StartTimer.wait_time = self.seconds_per_beat
	$StartTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
