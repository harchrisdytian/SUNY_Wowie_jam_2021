extends KinematicBody2D

signal shoot(EnemyBullet,pos,vel)

export (float) var Health = 300
export (float) var Max_Health = 300 
export (float) var Min_Health = 0 
export (float) var fire_rate
export (PackedScene) var EnemyBullet

var target 
var can_shoot = true
var player

func _ready():
	$Shoottimer.wait_time = fire_rate

func _physics_process(delta):
	update()
	if player != null:
		look_at(player.position)
		shoot()


func shoot():
	if can_shoot:
		emit_signal("shoot", EnemyBullet, $Position2D.global_position, Vector2(20,0).rotated(rotation))
		print("shooting")
		$Shoottimer.start()
		can_shoot = false

func _on_Shoottimer_timeout():
	can_shoot = true


func take_damage(value):
	Health = clamp(Health - value, Min_Health, Max_Health)
