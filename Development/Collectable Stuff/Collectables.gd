extends Area2D

#Could add more textures later here if needed
var texture = {"Coin" : "res://Collectable Stuff/Coin.png"}

func ready():
	$PickupSound.play()

#Function for when the player collects the powerup
func _on_Coin_body_entered(body):
	

	#Play sound triggered
	$PickupSound.play()
	
	#This is where to emit a signal the the GameManager that to increment
	#the number of coins
	
	queue_free()
