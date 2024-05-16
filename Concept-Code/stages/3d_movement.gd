extends Node3D
var speed = 0
var turn_speed = 2 
var max_speed = 250
var currency: int = 500 # driver start with this currency

func _ready():
	_display_current_currency()
	_wait_time_forIncrement()
	pass

func _process(delta):
	$buildingsChunk.position += Vector3(0,0,delta*speed)
	
	# turning left or right(left is key A, right is key D)
	if Input.is_action_just_pressed("user_action_left"):
		rotation_degrees.y -= turn_speed * delta * (speed / max_speed)

	if Input.is_action_just_pressed("user_action_right"):
		rotation_degrees.y += turn_speed * delta * (speed / max_speed)
	
	#$Camera3D.rotation_degrees = rotation_degrees.y
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
