extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# var player_gold // I need to get this value from the player scene
# The gold cost of the various upgrades, values of these numbers are likely to change
export var on_miss_u1_cost = 100
export var on_miss_u2_cost = 200
export var on_miss_u3_cost = 300

export var on_hit_u1_cost = 100
export var on_hit_u2_cost = 200
export var on_hit_u3_cost = 300

export var on_death_u1_cost = 100
export var on_death_u2_cost = 200
export var on_death_u3_cost = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Button availability // If the player does not have enough gold 
	# to buy an upgrade, the upgrades button should be disabled
	#____
	# if player_gold < on_miss_u1_cost:
		# OnMiss_U1_Button.disabled = true
	
	pass


	
