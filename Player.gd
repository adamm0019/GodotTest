extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const MAXFALLSPEED = 200
const MAXSPEED = 80
const JUMPFORCE = 300

var motion = Vector2()
func _ready():
	pass


func _physics_process(delta):
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if Input.is_action_pressed("right"):
		motion.x = MAXSPEED
	elif Input.is_action_pressed("left"):
		motion.x = -MAXSPEED
	else:
		motion.x = 0
	motion = move_and_slide(motion, UP)
	
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			motion.y = -JUMPFORCE
