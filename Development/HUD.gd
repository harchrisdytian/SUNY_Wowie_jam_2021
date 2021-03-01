extends Control

var max_health
var combo_value = 0
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
		
