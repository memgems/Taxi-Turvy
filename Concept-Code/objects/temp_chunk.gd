extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_straight_body_entered(body):
	var new_node = self.duplicate()
	get_parent().add_child(new_node)
	new_node.position = $straight_spawn.position
	pass # Replace with function body.
