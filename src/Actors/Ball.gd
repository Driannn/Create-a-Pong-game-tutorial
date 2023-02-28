extends KinematicBody2D

export var ball_speed = 450
var speed = ball_speed
var velocity = Vector2.ZERO

func _ready():
	randomize()
	velocity.x = [-1,1,-0.8,0.7,-0.7,0.8,-0.9,0.9,1.5,-1.5][randi() % 10]
	velocity.y = [-1,0.7,-0.7,1,-0.9,0.9,-0.6,0.6,1.5,-1.5,0.5,-0.5][randi() % 12]

func _physics_process(delta):
	var collision_object = 	move_and_collide(velocity * speed * delta)
	if collision_object:
		velocity = velocity.bounce(collision_object.normal)
		$CollisionSound.play()

func stop_ball():
	speed = 0
	
func restart_ball():
	speed = ball_speed
	randomize()
	velocity.x = [-1,1,-0.8,0.7,-0.7,0.8,-0.9,0.9,1.5,-1.5][randi() % 10]
	velocity.y = [-1,0.7,-0.7,1,-0.9,0.9,-0.6,0.6,1.5,-1.5,0.5,-0.5][randi() % 12]
