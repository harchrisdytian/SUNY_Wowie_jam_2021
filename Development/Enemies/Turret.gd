extends KinematicBody2D

signal shoot(EnemyBullet,pos,vel)

export (float) var Health = 300
export (int) var detect_radius
export (float) var fire_rate
export (PackedScene) var EnemyBullet

var damage_text = preload("res://Enemies/Damage_text.tscn")
var target 
var can_shoot = true
var player

signal on_die

func _ready():
	$Shoottimer.wait_time = fire_rate

func _physics_process(delta):
	update()
	if player != null:
		look_at(player.position)
		shoot()

func shoot():
	if can_shoot:
		emit_signal("shoot", EnemyBullet, $Position2D.global_position, Vector2(5,0).rotated(rotation))
		$Shoottimer.start()
		can_shoot = false

func _on_Shoottimer_timeout():
	can_shoot = true

func take_damage(damage):
	var text = damage_text.instance()
	text.amount = damage
	add_child(text)
	Health = clamp(Health - damage, 0 ,300)
	if Health == 0:
		queue_free()

