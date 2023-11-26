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
		update_frame(input_vector.x)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION*delta)
	
	
	move_and_slide()

# function to update the player image
# left-key is pressed: image on index 1 is called
# right-key analog
func update_frame(direction_x):
	var sprite_node = $Sprite2D
	if sprite_node != null:
		if direction_x < 0: 
			sprite_node.frame = 1 # left
		elif direction_x > 0:
			sprite_node.frame = 0 # right
	else:
		print("Fehler: Sprite2D Node wurde nicht gefunden.")
