extends Area2D


func ready():
	$PickupSound.play()
	

#Function for when the player collects the powerup
func _on_Coin_body_entered(body):
	
	if body.is_in_group("Player"):
	#Play sound triggered
		body.possible_gold += 10
		$PickupSound.play()
		queue_free()
	
	#This is where to emit a signal the the GameManager that to increment
	#the number of coins
	
