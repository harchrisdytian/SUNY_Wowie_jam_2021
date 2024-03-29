extends Node
onready var HUD = $CanvasLayer/HUD
var combo = 1
var effect =["Boom Boom",#0
			"Money Bandaid",#1
			"Spread Fire",#2
			"Bring the Thundah",#3
			"Tacticle Retreat"]#4
var cooldowns = [0,#0
				0,#1
				0,#2
				0,#3
				0]#4

func _ready():
	
	$Coins/SpawnScene.main_scene = self
	$Chests/SpawnScene.main_scene = self
	$SuicideBombers/SpawnScene.main_scene = self
	$Turret.player = $Player
	$Player.starting_values()
	$Player.started = true
	for Turret in get_tree().get_nodes_in_group("Turret"):
		Turret.player = $Player
		Turret.connect("shoot", self, "enemy_shoot")

func _process(delta):
	HUD.gold = $Player.possible_gold
func spawnCoins(scene, pos, scale):
	var c = scene.instance()
	c.position = pos
	c.scale = scale
	add_child(c)
	
	#Spawn other 2 coins with slightly different positions
	#positions
	

func shoot(scene,pos,vel,scal,lightning):
	var b = scene.instance()
	b.position = pos
	b.velocity = vel
	b.scale = scal
	b.lighting_bullet = lightning
	if combo > 0:
		b.damage = 10 * (combo * combo)
	else:
		b.damage = 10
	b.connect("hit",$Player,"on_hit")
	b.connect("hit", self, "on_hit")
	b.connect("miss",$Player,"on_miss")
	b.connect("critical_miss",$Player,"on_crit_miss")
	add_child(b)

func enemy_shoot(scene,pos,vel):
	var b = scene.instance()
	b.position = pos
	b.velocity = vel
	add_child(b)


func on_hit(scene,pos,lightning):
	print("stonks")
	if lightning:
		var l = scene.instance()
		l.global_position = pos
		add_child(l)
		




func combo_changed(combo_val,crit):
	combo = combo_val
	yield(get_tree(),"idle_frame")
	HUD.update_combo(combo_val)



func gold_changed(gold):
	pass # Replace with function body.


func health_changed(health):
	yield(get_tree(),"idle_frame")
	HUD.update_health(health)

func on_die():
	$Player.get_gold(20)

func cool_down(effect_id, cooldown_amount):
	HUD.cooldowns[effect_id] = cooldown_amount
	HUD.update_CoolDowns()
