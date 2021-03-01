extends Control

var max_health
var combo_value = 0
var gold =150
var effects =["Boom Boom",#0
			"Money Bandaid",#1
			"Spread Fire",#2
			"Bring the Thundah",#3
			"Tacticle Retreat"]#4
var cooldowns = [0,#0
				0,#1
				0,#2
				0,#3
				0]#4
func set_base_values():
	$HealthBar.max_health = max_health
	
func update_health(health):
	$HealthBar.value = health
	
func update_combo(value):
	combo_value = value
	if combo_value <= 0:
		$Combo.hide()
	else:
		$Combo.show()
		$Combo.text = str(value) + "x"
		

func update_CoolDowns():
	$CoolDowns.text = ""
	for i in range(effects.size()):
		if cooldowns[i] >= 0:
			$CoolDowns.text += effects[i] + ": " + str(cooldowns[i]) + "\n"


func _process(delta):
	$Gold.text = "Gold: " + str(gold) 
	
func _on_Timer_timeout():

	for i in range(cooldowns.size()):
		cooldowns[i] -= 1
	update_CoolDowns()

