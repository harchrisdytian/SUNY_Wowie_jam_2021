extends Node2D

#add this code to your level screen


func _ready():
	$Turret.player = $Player

func shoot(scene,pos,vel,scal):
	var b = scene.instance()
	b.position = pos
	b.velocity = vel
	b.scale = scal
	
	b.connect("hit",$Player,"on_hit")
	b.connect("hit",self,"on_hit")
	b.connect("miss",$Player,"on_miss")
	add_child(b)

func enemy_shoot(scene,pos,vel):
	var b = scene.instance()
	b.position = pos
	b.velocity = vel
	add_child(b)


func on_hit(scene,pos,lightning):
	print("stonks")
	if lightning:
		var l = scene.instance()
		l.global_position = pos
		add_child(l)
