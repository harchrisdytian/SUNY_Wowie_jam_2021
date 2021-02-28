extends Node2D
var enemies = []
var bodies
var next

func _process(delta):
	$lightning_vfxs/lightning_shader.global_position = ($effects/effect_1.global_position +$effects/effect_2.global_position) / 2
	$lightning_vfxs/lightning_shader.scale.x = $effects/effect_1.global_position.distance_to($effects/effect_2.global_position)/64
	$lightning_vfxs/lightning_shader.look_at($effects/effect_2.global_position )
	$lightning_vfxs/lightning_shader2.global_position = ($effects/effect_2.global_position +$effects/effect_3.global_position) / 2
	$lightning_vfxs/lightning_shader2.scale.x = $effects/effect_2.global_position.distance_to($effects/effect_3.global_position)/64
	$lightning_vfxs/lightning_shader2.look_at($effects/effect_3.global_position )
	
func _ready():
	var next_body = null
	for child_num in range($effects.get_child_count()):# loops threw all children
		
		if next_body != null: #checks if it not 
				enemies.append(next_body)
				$effects.get_child(child_num).global_position = next_body.global_position
		yield(get_tree().create_timer(0.1),"timeout")#gets all bodies in area
		bodies = $effects.get_child(child_num).get_overlapping_bodies() 
		print(bodies)
		if bodies != null: #checks if body
			var child = $effects.get_child(child_num)#gets current child
			next_body = null #resets bodies
			for body in bodies:#checks each body in range
				if body.is_in_group('enemies') and not body in enemies: #checks if it is an enemy
					print(child_num) # sets the area to the next enemy
					if next_body == null:
						next_body = body
					else:
						if (body.global_position.distance_squared_to(child.global_position) > next_body.global_position.distance_squared_to(child.global_position)): 
							next_body = body
	$effects/effect_1.global_position = next_body.position
