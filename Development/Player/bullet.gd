extends Area2D

signal miss
signal hit

var velocity = Vector2()

func _process(delta):
	position += velocity


func _on_Bullet_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("hit")
	else:
		emit_signal("miss")
