extends Node2D
class_name Weapon

@export var damage:int = 10
@export var reload_time_ms:int = 1000
@export var clip_size:int = 1
@export var attack_speed_ms:int = 1000
@export var arrow:PackedScene

var bullets_left
var time=0


func attack(creature, global_shoot_point_position:Vector2, bullet_angle):
	if bullets_left > 0:
		#print(bullets_left, "     bullets_left")
		#print(clip_size, "     clip_size")
		if Time.get_ticks_msec()-time>=attack_speed_ms:
			time=Time.get_ticks_msec()
			var instate=arrow.instantiate()
			instate.global_position=global_shoot_point_position/creature.scale #множитель хз от куда
			instate.rotation=bullet_angle
			instate.damage=damage
			add_child(instate)
			bullets_left -= 1
	elif Time.get_ticks_msec()-time>=reload_time_ms:
		bullets_left = clip_size
		#print("global_shoot_point_position", global_shoot_point_position, creature)
		#print("instate.global_position", instate.global_position, creature)
