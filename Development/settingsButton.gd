extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_settingsButton_pressed():
	$ButtonPressSound.play()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://Settings.tscn")


func _on_playButton_pressed():
	$ButtonPressSound2.play()
	Global.goto_scene("res://Levels/Level1.tscn")
	yield(get_tree().create_timer(1), "timeout")
#	get_tree().change_scene(#Main Scene)
	pass
