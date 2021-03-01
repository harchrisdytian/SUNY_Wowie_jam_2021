extends Node

var levels = ["res://Levels/Level1.tscn", "res://Levels/Level2.tscn", "res://Levels/Level3.tscn", "res://Levels/Level4.tscn"]

var lightning = false
var dodge = false
var miss_gold = false
var regen = false

var hit_explostion = false
var hit_speed = false
var hit_gold = false
var tripple_shot = false

var death_gold = false
var death_respawn = false
var death_respawn_gold = false
var regen_reduction = false

var current_scene = null

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)

func goto_scene(path):
	call_deferred("_deffered_goto_scene",path)
	
func _deffered_goto_scene(path):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instance()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)

