extends Node2D
var enemies = []
var bodies
var next

func _process(delta):
	$lightning_vfxs/lightning_shader.position = ($effects/effect_1.position +$effects/effect_2.position) / 2
	$lightning_vfxs/lightning_shader.scale.x = $effects/effect_1.position.distance_to($effects/effect_2.position)/64
	$lightning_vfxs/lightning_shader.look_at($effects/effect_2.position )
	$lightning_vfxs/lightning_shader2.position = ($effects/effect_2.position +$effects/effect_3.position) / 2
	$lightning_vfxs/lightning_shader2.scale.x = $effects/effect_2.position.distance_to($effects/effect_3.position)/64
	$lightning_vfxs/lightning_shader2.look_at($effects/effect_3.position )
	
func _ready():
	var next_body = null
	for child_num in range($effects.get_child_count()):# loops threw all children
		
		bodies = $effects.get_child(child_num).get_overlapping_bodies() 
		yield(get_tree().create_timer(0.3),"timeout")#gets all bodies in area
		if bodies != null: #checks if body
			var child = $effects.get_child(child_num)#gets current child
			next_body = null #resets bodies
			for body in bodies:#checks each body in range
				if body.is_in_group('enemies'): #checks if it is an enemy
					print(child_num) # sets the area to the next enemy
					if next_body == null:
						next_body = body
					else:
						if (body.global_position.distance_squared_to(child.global_position) > next_body.global_position.distance_squared_to(child.global_position)): 
							next_body = body
							enemies.append(body)
			if next_body != null: #checks if it not 
					child.global_position = next_body.global_position
#
