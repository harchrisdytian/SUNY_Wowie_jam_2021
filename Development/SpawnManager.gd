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
	
	##Fix This
	#for child in $SpawnLocations.get_children():
		#spawnPositionArray += child.position

#Fills the slots randomly. Function checks to make sure the
#same slot is not filled twice
func fillSlotsRandomly():
	
	var usedPositions = []
	#While there are still more slot that should be filled
	
	slotsStillToFill = $SpawnLocations.get_child_count()
	
	#Set to while loop
	#for i in range (amountOfSlotsRandomlyFilled):
	while(slotsStillToFill > 0):
		#Obtains a random number for an index
		var randomPosition
		
		if not randomPosition in usedPositions:
			
			
			##Fix This
			add_child(test)
			
			slotsStillToFill -= 1
			pass
		else:
			pass

