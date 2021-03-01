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

# giovoni added
var player_gold = 4000

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
		$Gun.shoot()
	velocity = move_and_slide(velocity)
#	print(velocity)

func take_damage(value):
	health = clamp(health - value, 0 ,100)
	#do damage effect

func on_hit(pos,fixed,this):
	miss_counter = 0
	emit_signal("combo_changed",miss_counter)
func on_miss():
	miss_counter += 1
	emit_signal("combo_changed",miss_counter)
	

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
	
func take_damge(damage):
	health -= max(damage,0)
	emit_signal("health_changed", health)
	if health == 0:
		die()


	
# Upgrade Menu Functionality added below by Giovonni ##
# These signals are where you would implement the effects of the upgrades after
# The corresponding button has been pushed
# for notation purposes ( _on_UpgradeMenu_OnMiss_U1  stands for the 1st upgrade
# of the OnMiss upgrade group



func _on_UpgradeMenu_OnMiss_U1():
	# When a player misses a shot, they earn an additional 1 gold
	# the next time they hit an enemy
	player_gold -= 50
	print("player gold = ", player_gold)
	pass # Replace with function body.


func _on_UpgradeMenu_OnMiss_U2():
	# When a player misses a shot, the next shot they take they regain 2% of
	# their health ( assuming that health would naturally degrade over time ) 
	# (that effect stacks)
	player_gold -= 150
	pass # Replace with function body.


func _on_UpgradeMenu_OnMiss_U3():
	#  After 3 consecutive misses, you become able to do a dodge attack
	player_gold -= 300
	pass # Replace with function body.


func _on_UpgradeMenu_OnMiss_U4():
	player_gold -= 500
	pass # Replace with function body.


func _on_UpgradeMenu_OnHit_U1():
	player_gold -= 250
	pass # Replace with function body.


func _on_UpgradeMenu_OnHit_U2():
	player_gold -= 300
	pass # Replace with function body.


func _on_UpgradeMenu_OnHit_U3():
	player_gold -= 400
	pass # Replace with function body.


func _on_UpgradeMenu_OnHit_U4():
	player_gold -= 500
	pass # Replace with function body.


func _on_UpgradeMenu_OnDeath_U1():
	player_gold -= 200
	pass # Replace with function body.


func _on_UpgradeMenu_OnDeath_U2():
	player_gold -= 250
	pass # Replace with function body.


func _on_UpgradeMenu_OnDeath_U3():
	player_gold -= 275
	pass # Replace with function body.


func _on_UpgradeMenu_OnDeath_U4():
	player_gold -= 350
	pass # Replace with function body.
