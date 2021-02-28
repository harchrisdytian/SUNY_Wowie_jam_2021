extends Area2D


func ready():
	$PickupSound.play()

#Function for when the player collects the powerup
func _on_Coin_body_entered(body):
	

	#Play sound triggered
	$PickupSound.play()
	
	#This is where to emit a signal the the GameManager that to increment
	#the number of coins
	
	queue_free()
