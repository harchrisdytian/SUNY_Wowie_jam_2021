extends Node

func _process(delta):
	for child in get_tree().get_nodes_in_group("Chests"):
		
		if not child.is_connected("spawnCoins"):
			child.connect("spawnCoins", self, "spawnCoins")


#Spawns coins as a child of the scene root
func spawnCoins(scene, pos, scale):
	var c = scene.instance()
	c.position = pos
	c.scale = scale
	add_child(c)
