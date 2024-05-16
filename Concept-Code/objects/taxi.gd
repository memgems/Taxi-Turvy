extends CharacterBody3D
var speed = 1
var constant_deacceleration = .4

func _ready():
	pass

func _process(delta):
	get_input()
	move_and_slide()
	if (velocity.z < -constant_deacceleration): 
		velocity.z += constant_deacceleration
	pass

func get_input():
	if Input.is_action_pressed("accelerate"):
		velocity.z -= speed
	if Input.is_action_pressed("brake"):
		if (velocity.z < -speed):
			velocity.z += speed
	pass
