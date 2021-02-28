extends Area2D

signal miss
signal hit
signal critical_miss
var crit = false
var lightnig = preload("res://lightning/lightning .tscn")
var velocity = Vector2(1,0)
var lighting_bullet = false

func _process(delta):
	position += velocity


func _on_Bullet_body_entered(body):
	if !body.is_in_group("Player"):
		if body.is_in_group("Enemies"):
			print("helo")
			emit_signal("hit", lighting_bullet, global_position)
		else:
			if crit:
				emit_signal("critical_miss")
			else:
				emit_signal("miss")
		queue_free()


func _on_CriticalMiss_body_entered(body):
	crit = true
