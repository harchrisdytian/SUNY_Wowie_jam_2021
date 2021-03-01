extends CanvasLayer


signal OnMiss_U1
signal OnMiss_U2
signal OnMiss_U3
signal OnMiss_U4

signal OnHit_U1
signal OnHit_U2
signal OnHit_U3
signal OnHit_U4

signal OnDeath_U1
signal OnDeath_U2
signal OnDeath_U3
signal OnDeath_U4

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

### var player_gold // I need to get this value from the player scene
# The gold cost of the various upgrades, values of these numbers are likely to change

#var player = preload("res://Player/Player.gd")

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

var default_color = Color(1,0,1,1)
var disable_color = Color(274)

var buying_gold = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$MenuBackground/OnMiss_U1_Button.modulate = default_color
	$MenuBackground/OnMiss_U2_Button.modulate = default_color
	$MenuBackground/OnMiss_U3_Button.modulate = default_color
	$MenuBackground/OnMiss_U4_Button.modulate = default_color
	
	$MenuBackground/OnHit_U1_Button.modulate = default_color
	$MenuBackground/OnHit_U2_Button.modulate = default_color
	$MenuBackground/OnHit_U3_Button.modulate = default_color
	$MenuBackground/OnHit_U4_Button.modulate = default_color
	
	$MenuBackground/OnDeath_U1_Button.modulate = default_color
	$MenuBackground/OnDeath_U2_Button.modulate = default_color
	$MenuBackground/OnDeath_U3_Button.modulate = default_color
	$MenuBackground/OnDeath_U4_Button.modulate = default_color
	
	#print(player.player_gold) 
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Button availability // If the player does not have enough gold 
	# to buy an upgrade, the upgrades button should be disabled
	# liekly to be cut in favor of different solution
	
	 $MenuBackground/GoldLabel.text = "Player Gold is :" + str(buying_gold)
	
	#____ On_Miss_U_Buttons
	 if buying_gold < on_miss_u1_cost:
		 $MenuBackground/OnMiss_U1_Button.disabled = true
	 if buying_gold < on_miss_u2_cost:
		 $MenuBackground/OnMiss_U2_Button.disabled = true
	 if buying_gold < on_miss_u3_cost:
		 $MenuBackground/OnMiss_U3_Button.disabled = true
	 if buying_gold < on_miss_u4_cost:
		 $MenuBackground/OnMiss_U4_Button.disabled = true

	#____ On_Hit_U_Buttons
	
	 if buying_gold < on_hit_u1_cost:
		 $MenuBackground/OnHit_U1_Button.disabled = true
	 if buying_gold < on_hit_u2_cost:
		 $MenuBackground/OnHit_U2_Button.disabled = true
	 if buying_gold < on_hit_u3_cost:
		 $MenuBackground/OnHit_U3_Button.disabled = true
	 if buying_gold < on_hit_u4_cost:
		 $MenuBackground/OnHit_U4_Button.disabled = true

	#____ On_Death_U_Buttons
	 if buying_gold < on_death_u1_cost:
		 $MenuBackground/OnDeath_U1_Button.disabled = true
	 if buying_gold < on_death_u2_cost:
		 $MenuBackground/ OnDeath_U2_Button.disabled = true
	 if buying_gold < on_death_u3_cost:
		 $MenuBackground/OnDeath_U3_Button.disabled = true
	 if buying_gold < on_death_u4_cost:
		 $MenuBackground/OnDeath_U4_Button.disabled = true
	#_________________________________________________________________________#
		pass

# The following code would show a description of the upgrade when the player has
# Their mouse over the Button

func _on_OnMiss_U1_Button_mouse_entered():
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " When you miss an attack, you earn an additional gold the next time you hit"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnMiss_U2_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " When you miss an attack, your next attack that hits grants a small amount of health"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnMiss_U3_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " After missing 3 straight attacks, you gain the ability to perform a dash attack"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnMiss_U4_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " After missing 3 straight attacks, the next attack you hit produces a chain lightning effect"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnHit_U1_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " When you take damage from an enemy, you emit a pulse of damaging energy"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnHit_U2_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " When you take damage from an enemy, you movement speed increases for a short amount of time"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnHit_U3_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " When you take damage from an enemy, you earn twice the damage taken in gold"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnHit_U4_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " When you take damage from an enemy, your attacks fire off in a spread for a short amount of time"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnDeath_U1_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " Upon dying on your next life, you gain an additional 50% of the gold you had on you"
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnDeath_U2_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = "On your next life, you start of with increased movement speed for a short amount of time "
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnDeath_U3_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = "On your next life, you earn a small amount of additional gold when you kill enemies "
	# Button Sound Effect
	$MenuBackground/ButtonPrepSound.position = $MenuBackground/DescriptionLabel.rect_position
	$MenuBackground/ButtonPrepSound.play()
	pass # Replace with function body.


func _on_OnDeath_U4_Button_mouse_entered():
	$MenuBackground/ButtonPrepSound.play()
	$MenuBackground/DescriptionLabel.rect_position = adjusted_position + get_viewport().get_mouse_position()
	$MenuBackground/DescriptionLabel.visible = true
	$MenuBackground/DescriptionLabel.text = " On your next life, the rate at which you gradualy lose health is reduced"
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

# Button Pressed Signals #


func _on_OnMiss_U1_Button_pressed():
	emit_signal("OnMiss_U1")
	$MenuBackground/OnMiss_U1_Button.disabled = true
	$MenuBackground/OnMiss_U1_Button.modulate = disable_color
	$MenuBackground/ButtonPressSound.play()
#
	pass # Replace with function body.


func _on_OnMiss_U2_Button_pressed():
	emit_signal("OnMiss_U2")
	$MenuBackground/OnMiss_U2_Button.disabled = true
#
#
	$MenuBackground/OnMiss_U2_Button.modulate = disable_color
	$MenuBackground/ButtonPressSound.play()
#
	pass # Replace with function body.


func _on_OnMiss_U3_Button_pressed():
	emit_signal("OnMiss_U3")
	$MenuBackground/OnMiss_U3_Button.disabled = true
#
#
	$MenuBackground/OnMiss_U3_Button.modulate = disable_color
	$MenuBackground/ButtonPressSound.play()
#
	pass # Replace with function body.


func _on_OnMiss_U4_Button_pressed():
	emit_signal("OnMiss_U4")
	$MenuBackground/OnMiss_U4_Button.disabled = true
#
#
	$MenuBackground/OnMiss_U4_Button.modulate = disable_color
	$MenuBackground/ButtonPressSound.play()
#
	pass # Replace with function body.


func _on_OnHit_U1_Button_pressed():
	emit_signal("OnHit_U1")
	$MenuBackground/OnHit_U1_Button.disabled = true
#
#
	$MenuBackground/OnHit_U1_Button.modulate = disable_color
	$MenuBackground/ButtonPressSound.play()
#
	pass # Replace with function body.


func _on_OnHit_U2_Button_pressed():
	emit_signal("OnHit_U2")
	$MenuBackground/OnHit_U2_Button.disabled = true
#
#
	$MenuBackground/OnHit_U2_Button.modulate = disable_color
	$MenuBackground/ButtonPressSound.play()
#
	pass # Replace with function body.


func _on_OnHit_U3_Button_pressed():
	emit_signal("OnHit_U3")
	$MenuBackground/OnHit_U3_Button.disabled = true
#
#
	$MenuBackground/OnHit_U3_Button.modulate = disable_color
	$MenuBackground/ButtonPressSound.play()
#
	pass # Replace with function body.


func _on_OnHit_U4_Button_pressed():
	emit_signal("OnHit_U4")
	$MenuBackground/OnHit_U4_Button.disabled = true
#
#
	$MenuBackground/OnHit_U4_Button.modulate = disable_color
	$MenuBackground/ButtonPressSound.play()
#
	pass # Replace with function body.


func _on_OnDeath_U1_Button_pressed():
	emit_signal("OnDeath_U1")
	$MenuBackground/OnDeath_U1_Button.disabled = true
#
#
	$MenuBackground/OnDeath_U1_Button.modulate = disable_color
	$MenuBackground/ButtonPressSound.play()
#
	pass # Replace with function body.


func _on_OnDeath_U2_Button_pressed():
	emit_signal("OnDeath_U2")
	$MenuBackground/OnDeath_U2_Button.disabled = true
#
#
	$MenuBackground/OnDeath_U2_Button.modulate = disable_color
	$MenuBackground/ButtonPressSound.play()
#
	pass # Replace with function body.


func _on_OnDeath_U3_Button_pressed():
	emit_signal("OnDeath_U3")
	$MenuBackground/OnDeath_U3_Button.disabled = true
#
#
	$MenuBackground/OnDeath_U3_Button.modulate = disable_color
	$MenuBackground/ButtonPressSound.play()
#
	pass # Replace with function body.


func _on_OnDeath_U4_Button_pressed():
	emit_signal("OnDeath_U4")
	$MenuBackground/OnDeath_U4_Button.disabled = true
#
#
	$MenuBackground/OnDeath_U4_Button.modulate = disable_color
	$MenuBackground/ButtonPressSound.play()
#
	pass # Replace with function body.

func _on_reset():
	# set all button.disabled to false
	pass
