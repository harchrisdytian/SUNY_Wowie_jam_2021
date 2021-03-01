extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.reset_values()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$UpgradeMenu.buying_gold = $Player.player_gold
	pass


func _on_ExitButton_pressed():
	$Player.set_values()
	yield(get_tree(),"idle_frame")
	Global.goto_scene("res://Levels/Level1.tscn")
