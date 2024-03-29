extends KinematicBody2D

var damage_text = preload("res://Enemies/Damage_text.tscn")

export var Acceleration = 200
export var friction = 500
export var Max_speed = 400
export (float) var Health = 100

signal on_die

enum {
	IDLE,
	CHASE
}

var state = CHASE
var velocity = Vector2.ZERO

func _ready():
	pass


func _physics_process(delta):
	explode()
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
			seek_player()
		CHASE:
			#chases the player 
			$AnimatedSprite.play()
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


func take_damage(damage):
	Health = max(Health - damage,0)
	var text = damage_text.instance()
	text.amount = damage
	add_child(text)
	if Health == 0:
		emit_signal("on_die")
		queue_free()

func explode():
	yield(get_tree(),"idle_frame")
	for idx in range(get_slide_count()):
		var collision = get_slide_collision(idx)
		if collision != null:
			if collision.collider.is_in_group("Player"):
				$CollisionShape2D.disabled = true
				$Particles2D.emitting = true
				$DespawnTimer.start()
				print("boom")
				collision.collider.take_damage(10)
				$AudioStreamPlayer.play()


func _on_DespawnTimer_timeout():
	Death()
	
func Death():
		yield(get_tree().create_timer(0.3),"timeout")
		queue_free()
