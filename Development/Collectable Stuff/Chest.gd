extends Area2D


export (PackedScene) var coin

func _ready():
	test()
	


#On body entered opens the chest
func _on_Chest_body_entered(body):
	#Chest opening animation
	$ChestAnimatedSprites.play()
	$AudioStreamPlayer2D.play()
	var c = coin.instance()
	add_child(c)

#This will be the on body enter I just made it a test func to test it in ready
func test():
	#Chest opening animation
	$ChestAnimatedSprites.play()
	$AudioStreamPlayer2D.play()
	yield(get_tree().create_timer(.8), "timeout")
	
	var c = coin.instance()
	add_child(c)
