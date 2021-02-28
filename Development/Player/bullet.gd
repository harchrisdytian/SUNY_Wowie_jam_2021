extends Area2D

signal miss
signal hit

var velocity = Vector2(1,0)
var lighting_bullet = true

func _process(delta):
	position += velocity


func _on_Bullet_body_entered(body):
	if body.is_in_group("Enemies"):
		emit_signal("hit")
		if lighting_bullet:
	else:
		emit_signal("miss")
