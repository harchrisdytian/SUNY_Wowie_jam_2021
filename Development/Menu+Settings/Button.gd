extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_backButton_pressed():
	$ButtonPressSound2.play()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://Menue_Scene.tscn")
