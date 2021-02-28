extends Area2D


signal hit

var velocity = Vector2(0,1)

func _process(delta):
	position += velocity



func _on_EnemyBullet_body_entered(body):
	if body.is_in_group("Player"):
		body.take_damage(25)
		emit_signal("hit")
		queue_free()
