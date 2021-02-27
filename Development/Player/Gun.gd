extends Sprite
signal shoot

var bullet

func _ready():
	look_at(get_global_mouse_position())

func shoot():
	emit_signal("shoot", bullet, $Spawn.global_position)
