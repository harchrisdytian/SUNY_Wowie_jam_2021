extends KinematicBody2D

signal shoot(EnemyBullet,pos,vel)

export (int) var detect_radius
export (float) var fire_rate
export (PackedScene) var EnemyBullet
var vis_color = Color(.867, .91, .247, 0.1)

var target 
var can_shoot = true
var player

func _ready():
	$Sprite.self_modulate = Color(0.2, 0, 0)
	$Shoottimer.wait_time = fire_rate

func _physics_process(delta):
	update()
	if player != null:
		look_at(player.position)
		shoot()


func shoot():
	if can_shoot:
		emit_signal("shoot", EnemyBullet, $Position2D.global_position, Vector2(25,0).rotated(rotation))
		$Shoottimer.start()
		can_shoot = false

func _on_Shoottimer_timeout():
	can_shoot = true

func _draw():
	#displays the visibility area
	draw_circle(Vector2(), detect_radius, vis_color)
