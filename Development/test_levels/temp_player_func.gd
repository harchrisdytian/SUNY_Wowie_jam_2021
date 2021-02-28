extends Node2D
#take this code a copy into whatever the level script is to make functionality
func _ready():
	pass

func shoot(scene,pos,vel,scal):
	var b = scene.instance()
	b.position = pos
	b.velocity = vel
	b.scale = scal
	b.connect("hit",$Player,"on_hit")
	b.connect("hit",self,"on_hit")
	b.connect("miss",$Player,"on_miss")
	add_child(b)

func on_hit(scene,pos,lightning):
	if lightning:
		var l = scene.instance()
		l.global_position = pos
		add_child(l)
