extends Node2D

#add this code to your level screen


func _ready():
	$Turret.player = $Player

func shoot(scene,pos,vel):
	var b = scene.instance()
	b.position = pos
	b.velocity = vel
	add_child(b)


