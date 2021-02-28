extends KinematicBody2D


export var Acceleration = 200
export var friction = 200
export var Max_speed = 1500
export var Health = 100

enum {
	IDLE,
	CHASE
}

var state = CHASE
var velocity = Vector2.ZERO




func _physics_process(delta):
	explode()
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
			seek_player()
		CHASE:
			#chases the player 
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


func take_damage(value):
	Health = clamp(Health - value, 0 ,100)

func explode():
	for idx in range(get_slide_count()):
		var collision = get_slide_collision(idx)
		if collision.collider.is_in_group("Player"):
			$CollisionShape2D.disabled = true
			$Particles2D.emitting = true
			$DespawnTimer.start()
			print("boom")


func _on_DespawnTimer_timeout():
	queue_free()
