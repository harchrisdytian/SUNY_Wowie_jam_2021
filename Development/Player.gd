extends KinematicBody2D

export(float) var health = 100
export(float) var speed = 500
export(PackedScene) var guns
export(Array, PackedScene) var mods = []

var velocity = Vector2()


func _ready():
	pass
	
func _process(delta):
	if Input.is_action_pressed("forward"):
		velocity.y = -1

	if Input.is_action_pressed("backwards"):
		velocity.y = 1
	if Input.is_action_pressed("left"):
		velocity.x = -1
	if Input.is_action_pressed("right"):
		velocity.x = 1
	
	velocity.normalized()
	velocity = velocity * speed 
	
	move_and_slide(velocity)
	velocity = Vector2()
