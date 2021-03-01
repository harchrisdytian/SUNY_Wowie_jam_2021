extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.starting_values()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$UpgradeMenu.buying_gold = $Player.player_gold
	pass


func _on_ExitButton_pressed():
	$Player.set_values()
#	print(pick_level())
	
	Global.goto_scene(pick_level())

func pick_level():
	var level = Global.levels
	
	randomize()
	
	return level[randi()% level.size()]
	
