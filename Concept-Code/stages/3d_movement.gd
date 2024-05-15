extends Node3D
var speed = 0
var turn_speed = 2 
var max_speed = 250
var currency: int = 500 # driver start with this currency

# Called when the node enters the scene tree for the first time.
func _ready():
	_display_current_currency()
	_wait_time_forIncrement()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	$Camera3D.position -= Vector3(0,0,delta*speed)
	pass

	$buildingsChunk.position += Vector3(0,0,delta*speed)
	
	# turning left or right(left is key A, right is key D)
	if Input.is_action_just_pressed("user_action_left"):
		rotation_degrees.y -= turn_speed * delta * (speed / max_speed)
		
	if Input.is_action_just_pressed("user_action_right"):
		rotation_degrees.y += turn_speed * delta * (speed / max_speed)
	
	#$Camera3D.rotation_degrees = rotation_degrees.y
	pass

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
	pass

# displaying the currency of the driver
func _display_current_currency():
	
	$Label.text= "Currency: " + str(currency)

# adding NPC payment to currency
func _adding_to_currency():
	var npc_amount = _npcPayment()
	currency += npc_amount
	_display_current_currency()

func _npcPayment() -> int:
	# I'm assuming that NPC will be givining random balance upon destination for now
	
	return randi_range(500, 1000)

# I will create the wait time before increement happens today( last thing)

func _wait_time_forIncrement():
	await get_tree().create_timer(4.0).timeout
	_adding_to_currency()
