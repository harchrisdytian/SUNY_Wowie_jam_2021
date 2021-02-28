extends StaticBody2D

signal spawnCoins(scene, pos, scale)

export (PackedScene) var coin

func _ready():
	pass

#Take Damage Function
func takeDamage():
	#Chest opening animation
	$ChestAnimatedSprites.play()
	#Chest sound play
	$AudioStreamPlayer2D.play()
	#Yield spawning untill chest animation ends
	yield(get_tree().create_timer(.8), "timeout")
	#Saves instance as a variable
	#var c = coin.instance()
	#c.position += Vector2(5,5)
	#c.scale = Vector2(.04,.04)
	emit_signal("spawnCoins",coin,global_position + Vector2(5,5),Vector2(.04,.04))
	#add_child(c)
	
	queue_free()
	
	
