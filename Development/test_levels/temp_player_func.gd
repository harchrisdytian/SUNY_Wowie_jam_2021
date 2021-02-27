extends Node2D
#take this code a copy into whatever the level script is to make functionality
func _ready():
	pass

func shoot(scene,pos,vel):
	var b = scene.instance()
	b.position = pos
	b.velocity = vel
	b.connect("hit",$Player,"on_hit")
	b.connect("miss",$Player,"on_miss")
	add_child(b)
