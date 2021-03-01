extends KinematicBody2D

enum{IDLE, RUN}
export(float) var health = 100
export(float) var MaxHealth = 100
export(PackedScene) var guns
export(Array, PackedScene) var mods = []
export(float) var max_speed = 2000
export(float) var acceleration = 500
export(float) var friction = 200
export(PackedScene) var bullet 
export(float) var bullet_speed = 10 setget set_bullet_speed
export(float) var bullet_size = 0.3
export(Vector2) var camera_zoom = Vector2(0.5,0.5)
#internal
var velocity = Vector2()
var movement_axis = Vector2()
var miss_counter = 0

export(bool) var lightning = false
export(bool) var dodge = false
export(bool) var miss_gold = false
export(bool) var regen = false

export(bool) var hit_explostion = false
export(bool) var hit_speed = false
export(bool) var hit_gold = false
export(bool) var tripple_shot = false

export(bool) var death_gold = false
export(bool) var death_respawn = false
export(bool) var death_respawn_gold = false
export(bool) var regen_reduction = false
# giovoni added
var player_gold = 2000

var OnMiss_U1_active = false

signal gold_changed(gold)
signal health_changed(health)
signal combo_changed(combo)
#----------------------------------------------------------------#
var current_state = IDLE
func _ready():
	
	$Camera2D.zoom = camera_zoom
	$Gun.bullet_scale = bullet_size
	$Gun.bullet = bullet
	$Gun.connect("shoot",get_parent(),"shoot")
	self.bullet_speed = bullet_speed
	
	emit_signal("health_changed",health)

func set_bullet_speed(val):
	bullet_speed = val
	$Gun.speed = val
	
	
func _process(delta):
	#gets the direction of the movement 
	movement_axis.y = int(Input.is_action_pressed("backwards")) -int(Input.is_action_pressed("forward"))
	movement_axis.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	movement_axis = movement_axis.normalized()

	velocity += movement_axis * acceleration * delta
	#friction
	if velocity.length() > friction * delta:
		velocity -= velocity.normalized() * delta * friction
	else:
		velocity = Vector2.ZERO
		
	velocity = velocity.clamped(max_speed)
	if velocity.x > 0:
		$PlayerAnimations.scale.x = 0.33
	else:
		$PlayerAnimations.scale.x = -0.33
	
	if velocity.length_squared() > 0:
		change_state(RUN)
	else:
		change_state(IDLE)
	
	if Input.is_mouse_button_pressed(1):
		$Gun.lightning = lightning
		$Gun.tripple_shot = tripple_shot
		$Gun.shoot()
	velocity = move_and_slide(velocity)
#	print(velocity)

func take_damage(damage):
	print('working')
	health = max(health - damage,0)
	emit_signal("health_changed", health)
	if health == 0:
		die()


func on_hit(pos,fixed,this):
	miss_counter = 0
	emit_signal("combo_changed",miss_counter,false)

func on_miss():
	print(3)
	miss_counter += 1
	emit_signal("combo_changed",miss_counter,false)

func on_crit_miss():
	miss_counter +=2
	emit_signal("combo_changed",miss_counter,true)


func change_state(state):
	if state != current_state:
		current_state = state
		match state:
			IDLE:
				$PlayerAnimations/AnimationPlayer.play("Idle")
			RUN:
				$PlayerAnimations/AnimationPlayer.play("Run")



#######
#making everything work
#####
func die():
	pass# god to death screen here
	



	
# Upgrade Menu Functionality added below by Giovonni ##
# These signals are where you would implement the effects of the upgrades after
# The corresponding button has been pushed
# for notation purposes ( _on_UpgradeMenu_OnMiss_U1  stands for the 1st upgrade
# of the OnMiss upgrade group
func reset_values():
	lightning = false
	dodge = false
	miss_gold = false
	regen = false

	hit_explostion = false
	hit_speed = false
	hit_gold = false
	tripple_shot = false

	death_gold = false
	death_respawn = false
	death_respawn_gold = false
	regen_reduction = false

func starting_values():
	
	lightning = Global.lightning
	dodge = Global.dodge
	miss_gold = Global.miss_gold
	regen = Global.regen

	hit_explostion = Global.hit_explostion
	hit_speed = Global.hit_speed
	hit_gold = Global.hit_gold
	tripple_shot = Global.tripple_shot

	death_gold = Global.death_gold
	death_respawn = Global.death_respawn
	death_respawn_gold = Global.death_respawn_gold
	regen_reduction = Global.regen_reduction

func set_values():
	
	Global.lightning = lightning
	Global.dodge = dodge
	Global.miss_gold = miss_gold
	Global.regen = regen

	Global.hit_explostion = hit_explostion
	Global.hit_speed = hit_speed
	Global.hit_gold = hit_gold
	Global.tripple_shot = tripple_shot

	Global.death_gold = death_gold
	Global.death_respawn = death_respawn
	Global.death_respawn_gold = death_respawn_gold
	Global.regen_reduction = regen_reduction


func _on_UpgradeMenu_OnMiss_U1():
	# When a player misses a shot, they earn an additional 1 gold
	# the next time they hit an enemy - [Loose Change]
	player_gold -= 50
	print("player gold = ", player_gold)
	pass # Replace with function body.


func _on_UpgradeMenu_OnMiss_U2():
	# When a player misses a shot, the next shot they take they regain 2% of
	# their health ( assuming that health would naturally degrade over time ) 
	# (that effect stacks) -[Health Regen]
	player_gold -= 150
	pass # Replace with function body.


func _on_UpgradeMenu_OnMiss_U3():
	#  After 3 consecutive misses, you become able to do a dodge attack
	# - [ Quick Step ]
	player_gold -= 300
	pass # Replace with function body.


func _on_UpgradeMenu_OnMiss_U4():
	# When the player misses 3 shots The next shot that hits an enemy
	# produces a chain lightning attack that jumps to all other enemies within 
	# range. This ability would then go on cooldown before it can be used again.
	# - [ Bring Da Thunder ]
	player_gold -= 500
	pass # Replace with function body.


func _on_UpgradeMenu_OnHit_U1():
	# When the player takes damage from an enemy, they emit a pulse of energy 
	# around them that damages enemies. This ability would then go on cooldown 
	# before it can be used again. 
	# [ BoomBoom ]
	player_gold -= 250
	pass # Replace with function body.


func _on_UpgradeMenu_OnHit_U2():
	# When the player takes damage from an enemy, their movement speed 
	# increases by 150%, for 30 seconds. – [ Tactical Retreat ]
	player_gold -= 300
	pass # Replace with function body.


func _on_UpgradeMenu_OnHit_U3():
	# When the player takes damage from an enemy, they earn twice the damage
	#  taken in gold. This ability would then go on cooldown before it can be 
	# used again. - [ Money Band Aid ]
	player_gold -= 400
	pass # Replace with function body.


func _on_UpgradeMenu_OnHit_U4():
	# When the player takes damage from an enemy, their shots fire in a 3
	# bullet spread for 10 seconds. This ability would then go on cooldown 
	# before it can be used again. - [ Spread Fire ]
	player_gold -= 500
	pass # Replace with function body.


func _on_UpgradeMenu_OnDeath_U1():
	player_gold -= 200
	# When the player dies, they get an additional 50% of the gold they had on 
	# them. 
	# [ Savings Account ]
	pass # Replace with function body.


func _on_UpgradeMenu_OnDeath_U2():
	# Upon respawning, the player has their movement speed increased by 50% for
	# 30 seconds.
	# - [ Pants of Running ]
	player_gold -= 250
	pass # Replace with function body.


func _on_UpgradeMenu_OnDeath_U3():
	# Upon respawning, the player earns 15% more gold from killing enemies for 
	# 30 seconds 
	# – [ Purse Cleaner ]
	player_gold -= 275
	pass # Replace with function body.


func _on_UpgradeMenu_OnDeath_U4():
	#  The rate that the player naturally loses health is reduced by 50 % for 
	# 30 seconds on your next life. 
	# – [ Good Heart ]
	player_gold -= 350
	pass # Replace with function body.


func every_second():
	if regen_reduction:
		take_damage(1)
	else:
		take_damage(2)
