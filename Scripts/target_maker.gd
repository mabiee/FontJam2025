extends Node2D

@export var target_tscn: PackedScene
var counter = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func draw_target(next_coord: Vector2):
	var target: Node2D = target_tscn.instantiate()
	self.add_child(target)
	target.position = next_coord
	print('this target is at:', target.position)

func draw_note(pos: Vector2):
	var target: Node2D = target_tscn.instantiate()
	self.add_child(target)
	var offset = 1
	target.position.x = (pos.x + offset) * 100
	target.position.y = (pos.y + offset) * 170
	print('target is at:', target.position)
	counter+=20
	
