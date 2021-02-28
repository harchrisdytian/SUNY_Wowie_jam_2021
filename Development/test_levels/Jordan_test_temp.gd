extends Node

func _ready():
	$Coins/SpawnScene.main_scene = self
	$Chests/SpawnScene.main_scene = self
func spawnCoins(scene, pos, scale):
	var c = scene.instance()
	c.position = pos
	c.scale = scale
	add_child(c)
