extends CharacterBody2D

# callback function
# _ready() is executed, when "Player" is loaded

const ACCELERATION = 10000 # get faster the "longer" you go
const MAX_SPEED = 150 # max speed of player
const FRICTION = 10000 # kind of like a resistance

# control movements 
# Q: What is delta?
# A: It contains the time, the last frame took to process
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	
	# move left/right
	input_vector.x = Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	# move up/down
	input_vector.y = Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	# normalize the vector
	input_vector = input_vector.normalized()
	
	# diagonal movements are also possible with this implemenation
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION*delta)
	
	move_and_collide(velocity*delta)
