extends Area2D

signal miss
signal hit
signal critical_miss

var damage = 1
var crit = false
var lightnig = preload("res://lightning/lightning .tscn")
var velocity = Vector2(1,0)
var lighting_bullet = true

func _process(delta):
	position += velocity


func _on_Bullet_body_entered(body):
	print("hit anything")
	if !body.is_in_group("Player"):
		if body.is_in_group("Enemies"):
			if body.has_method("take_damage"):
				body.take_damage(damage)
			emit_signal("hit", lightnig, global_position, lighting_bullet)
		else:
			if crit:
				emit_signal("critical_miss")
			else:
				emit_signal("miss")
		queue_free()


func _on_CriticalMiss_body_entered(body):
	crit = true
