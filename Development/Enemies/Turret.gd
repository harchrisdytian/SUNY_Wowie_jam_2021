extends KinematicBody2D

signal shoot(EnemyBullet,pos,vel)

export (float) var Health = 300
export (int) var detect_radius
export (float) var fire_rate
export (PackedScene) var EnemyBullet

var target 
var can_shoot = true
var player

func _ready():
	$Shoottimer.wait_time = fire_rate
	print(Health)

func _physics_process(delta):
	update()
	if player != null:
		look_at(player.position)
		shoot()

func shoot():
	if can_shoot:
		emit_signal("shoot", EnemyBullet, $Position2D.global_position, Vector2(25,0).rotated(rotation))
		$AudioStreamPlayer.play()
		$Shoottimer.start()
		can_shoot = false

func _on_Shoottimer_timeout():
	can_shoot = true

func damage_taken(value):
	Health = clamp(Health - value, 0 ,300)
	if Health == 0:
		queue_free()

