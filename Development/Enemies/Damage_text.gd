extends Position2D

onready var label = $Label
onready var tween = $Tween
var amount = 0

func _ready():
	label.set_text(str(amount))
	
	
