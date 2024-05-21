extends Camera3D
var speed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position -= Vector3(0,0,delta*speed)

func _input(event):
	# going forward, personally think we will need an acceleration speed also
	# forward key is W && backward key is S
	if event.is_action_pressed("user_action"):
		speed+=3
	if event.is_action_released("user_action"):
		speed-=2
	# this is for reverse movement
	if event.is_action_pressed("user_action_reverse"):
		speed -= 5
	if event.is_action_released("user_action_reverse"):
		if(speed < 0):
			speed = 1
		speed = speed
	#hardbrake is space
	if event.is_action_pressed("user_action_hardbrake"):
		speed =0
