extends Node
var movement_path = preload("res://Concept-Code/objects/movement path.tscn")
var waiting = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not waiting:
		waiting = true
		spawn_builing()
	pass

func spawn_builing():
	var instance = movement_path.instantiate()
	add_child(instance)
	#instance.global_rotation = 0
	await get_tree().create_timer(4.0).timeout
	waiting = false
