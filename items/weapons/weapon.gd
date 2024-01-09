extends Node2D
class_name Weapon
@export var damae:int = 10
@export var attack_speed:float = 2
@export var clip_size:int = 4
@export var reload_time:int = 1
@export var arrow:PackedScene
var attack_timer=0
var global_mouse_position
var direction: Vector2
var creature_position: Vector2
func attack(creature, delta, shoot_point_position):
	attack_timer-=delta
	if Input.is_action_pressed("attack") and attack_timer <= 0:
		creature_position=creature.position
		attack_timer = reload_time
		global_mouse_position = get_global_mouse_position()
		var global_shoot_point_position=shoot_point_position*creature.scale+creature_position
		direction = (global_mouse_position - global_shoot_point_position).normalized()
		var instate=arrow.instantiate()
		instate.global_position=global_shoot_point_position
		instate.rotation=direction.angle()
		add_child(instate)
		#print("creature_position", creature_position, creature)
		#print("global_mouse_position", global_mouse_position, creature)	
		print("global_shoot_point_position", global_shoot_point_position, creature)
		print("instate.global_position", instate.global_position, creature)
