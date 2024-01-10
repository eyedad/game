extends Node2D
class_name Weapon
@export var damage:int = 10
@export var attack_speed:float = 2
@export var clip_size:int = 4
@export var reload_time_ms:int = 1000
@export var arrow:PackedScene
var time=0

func attack(creature, global_shoot_point_position:Vector2, bullet_angle):
	if Time.get_ticks_msec()-time>=reload_time_ms:
		time=Time.get_ticks_msec()
		var instate=arrow.instantiate()
		instate.global_position=global_shoot_point_position/2 #множитель хз от куда
		instate.rotation=bullet_angle
		instate.damage=damage
		add_child(instate)
		
		#print("global_shoot_point_position", global_shoot_point_position, creature)
		#print("instate.global_position", instate.global_position, creature)
