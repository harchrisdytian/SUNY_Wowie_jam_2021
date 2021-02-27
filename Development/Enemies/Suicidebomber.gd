extends KinematicBody2D


export var accelleration = 200
export var friction = 200
export var max_speed = 50


enum {
	IDLE,
	WANDER,
	CHASE
}

var target 
var can_shoot = true
var state = CHASE
var velocity = Vector2.ZERO




func _physics_process(delta):
	match state:
		IDLE:
			velocity = velocity.move_towards(Vector2.ZERO, friction * delta)
		
		WANDER:
			pass
			
		CHASE:
			pass

