extends Area2D


signal hit

var velocity = Vector2(0,1)

func _process(delta):
	position += velocity



func _on_EnemyBullet_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("hit")
		print("hit")
		queue_free()
