extends KinematicBody2D

export(float) var health = 100
export(float) var MaxHealth = 100
export(PackedScene) var guns
export(Array, PackedScene) var mods = []
export(float) var max_speed = 2000
export(float) var acceleration = 3000
export(float) var friction = 10

#internal
var velocity = Vector2()
var movement_axis = Vector2()

func _ready():
	pass

func _process(delta):
	#gets the direction of the movement 
	movement_axis.y = int(Input.is_action_pressed("backwards")) -int(Input.is_action_pressed("forward"))
	movement_axis.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	movement_axis = movement_axis.normalized()

	velocity += movement_axis * acceleration * delta
	#friction
	if velocity.length() > friction * delta:
		velocity -= velocity * delta * friction
	else:
		velocity = Vector2.ZERO
		
	velocity = velocity.clamped(max_speed)
	
	move_and_slide(velocity)
	print(velocity)

func take_damage(value):
	health = clamp(health - value, 0 ,100)
	#do damage effect
	
	

