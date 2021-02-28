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
export(float) var bullet_speed = 100 setget set_bullet_speed
export(float) var bullet_size = 0.3
#internal
var velocity = Vector2()
var movement_axis = Vector2()
var miss_counter = 0

# giovoni added
var player_gold = 100 

var OnMiss_U1_active = false

#----------------------------------------------------------------#
var current_state = IDLE
func _ready():

	$Gun.bullet_scale = bullet_size
	$Gun.bullet = bullet
	$Gun.connect("shoot",get_parent(),"shoot")
	self.bullet_speed = bullet_speed
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
	move_and_slide(velocity)
#	print(velocity)

func take_damage(value):
	health = clamp(health - value, 0 ,100)
	#do damage effect

func on_hit(pos):
	print("yay")
	miss_counter = 0
	
func on_miss():
	miss_counter = min(health - 1, 0)
	print("miss")

func change_state(state):
	if state != current_state:
		current_state = state
		match state:
			IDLE:
				$PlayerAnimations/AnimationPlayer.play("Idle")
			RUN:
				$PlayerAnimations/AnimationPlayer.play("Run")







# Upgrade Menu Functionality added below by Giovonni ##
# These signals are where you would implement the effects of the upgrades after
# The corresponding button has been pushed
# for notation purposes ( _on_UpgradeMenu_OnMiss_U1  stands for the 1st upgrade
# of the OnMiss upgrade group



func _on_UpgradeMenu_OnMiss_U1():
	# testing effects
	self.scale.x = 10
	player_gold -= 50
	print("player gold = ", player_gold)
	pass # Replace with function body.


func _on_UpgradeMenu_OnMiss_U2():
	pass # Replace with function body.


func _on_UpgradeMenu_OnMiss_U3():
	pass # Replace with function body.


func _on_UpgradeMenu_OnMiss_U4():
	pass # Replace with function body.


func _on_UpgradeMenu_OnHit_U1():
	pass # Replace with function body.


func _on_UpgradeMenu_OnHit_U2():
	pass # Replace with function body.


func _on_UpgradeMenu_OnHit_U3():
	pass # Replace with function body.


func _on_UpgradeMenu_OnHit_U4():
	pass # Replace with function body.


func _on_UpgradeMenu_OnDeath_U1():
	pass # Replace with function body.


func _on_UpgradeMenu_OnDeath_U2():
	pass # Replace with function body.


func _on_UpgradeMenu_OnDeath_U3():
	pass # Replace with function body.


func _on_UpgradeMenu_OnDeath_U4():
	pass # Replace with function body.
