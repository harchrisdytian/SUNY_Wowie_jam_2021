extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

### var player_gold // I need to get this value from the player scene
# The gold cost of the various upgrades, values of these numbers are likely to change

export var on_miss_u1_cost = 100
export var on_miss_u2_cost = 200
export var on_miss_u3_cost = 300
export var on_miss_u4_cost = 400

export var on_hit_u1_cost = 100
export var on_hit_u2_cost = 200
export var on_hit_u3_cost = 300
export var on_hit_u4_cost = 400

export var on_death_u1_cost = 100
export var on_death_u2_cost = 200
export var on_death_u3_cost = 300
export var on_death_u4_cost = 400

var adjusted_position = Vector2(-50,-50)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Button availability // If the player does not have enough gold 
	# to buy an upgrade, the upgrades button should be disabled
	#____ On_Miss_U_Buttons
	# if player_gold < on_miss_u1_cost:
		# OnMiss_U1_Button.disabled = true
	# if player_gold < on_miss_u2_cost:
		# OnMiss_U2_Button.disabled = true
	# if player_gold < on_miss_u3_cost:
		# OnMiss_U3_Button.disabled = true
	# if player_gold < on_miss_u4_cost:
		# OnMiss_U4_Button.disabled = true
		
	#____ On_Hit_U_Buttons
	# if player_gold < on_hit_u1_cost:
		# OnHit_U1_Button.disabled = true
	# if player_gold < on_hit_u2_cost:
		# OnHit_U2_Button.disabled = true
	# if player_gold < on_hit_u3_cost:
		# OnHit_U3_Button.disabled = true
	# if player_gold < on_hit_u4_cost:
		# OnHit_U4_Button.disabled = true
		
	#____ On_Death_U_Buttons
	# if player_gold < on_death_u1_cost:
		# OnDeath_U1_Button.disabled = true
	# if player_gold < on_death_u2_cost:
		# OnDeath_U2_Button.disabled = true
	# if player_gold < on_death_u3_cost:
		# OnDeath_U3_Button.disabled = true
	# if player_gold < on_death_u4_cost:
		# OnDeath_U4_Button.disabled = true
	#_________________________________________________________________________#
	
	pass

# The following code would show a description of the upgrade when the player has
# Their mouse over the Button

func _on_OnMiss_U1__Button_mouse_entered():
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " Hello you are on my Button"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnMiss_U2_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " Hello you are on my other Button, please stop this !"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnMiss_U3_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " Hello you are on my Button"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnMiss_U4_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " Hello you are on my Button"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnHit_U1_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " Hello you are on my Button"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnHit_U2_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " Hello you are on my Button"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnHit_U3_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " Hello you are on my Button"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnHit_U4_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " Hello you are on my Button"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnDeath_U1_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " Hello you are on my Button"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnDeath_U2_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " Hello you are on my Button"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnDeath_U3_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " Hello you are on my Button"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnDeath_U4_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " Hello you are on my Button"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.

#_____________________________________________________________________________#


func _on_ExitButton_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " Leave this Menu"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_ExitButton_pressed():
	$MenuBackground.visible = false
	pass # Replace with function body.
