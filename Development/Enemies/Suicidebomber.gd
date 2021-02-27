extends KinematicBody2D


export var Acceleration = 200
export var friction = 200
export var Max_speed = 50
export var Health = 100

enum {
	IDLE,
	CHASE
}

var target 
var can_shoot = true
var state = CHASE
var velocity = Vector2.ZERO




func _physics_process(delta):
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
			seek_player()
		CHASE:
			var player = $Playerdetectionzone.player
			if player != null:
				var direction = (player.global_position - global_position).normalized()
				velocity = velocity.move_toward(direction * Max_speed, Acceleration * delta)
				$AnimatedSprite.flip_h = velocity.x < 0
			else:
				state = IDLE
	velocity = move_and_slide(velocity)

func seek_player():
	if $Playerdetectionzone.can_see_player():
		state = CHASE
