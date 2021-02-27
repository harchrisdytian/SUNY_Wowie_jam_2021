extends Node

var rng = RandomNumberGenerator.new()
export (int) var amountOfSlotsRandomlyFilled
var slotsStillToFill = 0
var spawnPositionArray = []
export (PackedScene) var test

# Called when the node enters the scene tree for the first time.
func _ready():
	#Randomizes rng
	rng.randomize()
	
	#Fills the spawnPositionArray with the potential spawn locations
	for child in $SpawnLocations.get_children():
		spawnPositionArray.append(child.position)
	
	#Spawns Items in Random Locations based on the spawnPositionArray
	fillSlotsRandomly()

#Fills the slots randomly. Function checks to make sure the
#same slot is not filled twice
func fillSlotsRandomly():
	
	#Create an array to store the used positions to
	#avoid filling the same location more than once
	var usedPositions = []
	
	#Initializes the amount of slots that still need to be filled
	#(This also is an index to check when the loop has filled enough spots)
	slotsStillToFill = amountOfSlotsRandomlyFilled
	
	var index = 0
	
	#While loop to fill random spots in the spawnPositionArray
	while(slotsStillToFill > 0):
		
		#Obtains a random number to randomize the position
		var randomPosition = rng.randi_range(0,$SpawnLocations.get_child_count())
		
		#If the random position selected is not prevoiusly choosen 
		if not randomPosition in usedPositions:
			
			#Spawn Item to spawn Here(Enemy, chest, coin etc.)
			var c = test.instance()
			c.position = spawnPositionArray[randomPosition]
			
			add_child(c)
			
			print(c.position)
			
			index += 1
			
			#Saves the position filled into an array to avoid spawning multiple
			#in the same location
			usedPositions.append(randomPosition)
			
			#Decrement the slots remaining to fill(Eventually ends the loop once
			#everything is spawning into the scene)
			slotsStillToFill -= 1
			pass
		
		#If the random position selected has been prevoiusly choosen, then pass
		#and start the loop again to try again
		else:
			pass

