extends Sprite
signal shoot(bullet,pos,vel)

var shoot = true
var bullet
var cool_down setget set_timer, get_timer
var velocity =Vector2()
var speed = 0
var bullet_scale
var can_shoot= true
func _process(delta):
	look_at(get_global_mouse_position())


func set_timer(val):
	$Timer.wait_time =val 

func get_timer():
	return $Timer.wait_time

func shoot():
	if(can_shoot):
		$Timer.start()
		print("stuff")
		velocity = Vector2(1,0).rotated(global_rotation) * speed
		emit_signal("shoot", bullet, $Spawn.global_position, velocity, bullet_scale * Vector2(1,1))
		can_shoot = false
		


func can_shoot():
	can_shoot = true
