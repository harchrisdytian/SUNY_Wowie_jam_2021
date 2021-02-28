extends Area2D


var player = null 


func can_see_player():
	return player != null




func _on_Playerdetectionzone_body_entered(body):
	if body.is_in_group("Player"):
		player = body


func _on_Playerdetectionzone_body_exited(body):
	player = null
