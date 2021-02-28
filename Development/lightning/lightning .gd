extends Node2D
var enemies = []
var bodies
var next

func _process(delta):
	$lightning_vfxs/lightning_shader.position = ($effect_1.position +$effect_2.position) / 2
	$lightning_vfxs/lightning_shader.scale.x = $effect_1.position.distance_to($effect_2.position)/64
	$lightning_vfxs/lightning_shader.look_at($effect_2.position )
func _ready():
	pass
#	var next_body = null
#	for child_num in range(get_child_count()):
#		var child = get_child(child_num)
#		if !child_num == 0:
#			child.global_position = next_body.global_position
#		bodies = get_child(child_num).get_overlapping_bodies()
#		next_body = null
#		for body in bodies:
#			if body.is_in_group(enemies):
#				if body == null:
#					next_body = body
#				else:
#					if body.global_position.distance_squared_to(child) > next_body.distance_squared_to(child) and body.global_position.distance_squared_to(child) > 10:
#						next_body = body
#		yield(get_tree().create_timer(0.2),"timeout")
#
