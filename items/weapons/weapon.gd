extends Node2D
class_name Weapon
#enum WeaponType {
	#Melee,
	#Ranged
#}


@export var base_damage:int = 30
@export var reload_time_ms:int = 1000
@export var clip_size:int = 1
@export var attack_speed_ms:int = 1000
@export var attack_scene:PackedScene
#@export var weapon_type: WeaponType

var damage = base_damage
var bullets_left
var time=0
var random_number = randf_range(-0.2, 0.2)


func attack(global_attack_position:Vector2):
	var creature=get_parent()
	var shoot_point_position = $"../shoot_point".position
	#global_mouse_position = to_global(DisplayServer.mouse_get_position())
	#global_mouse_position = get_global_mouse_position()
	var global_shoot_point_position=shoot_point_position*creature.scale+creature.position
	var direction = (global_attack_position - global_shoot_point_position).normalized()
	if bullets_left > 0:
		if Time.get_ticks_msec()-time>=attack_speed_ms+random_number*attack_speed_ms:
			time=Time.get_ticks_msec()
			var instate=attack_scene.instantiate()
			#instate.global_position=global_shoot_point_position/creature.scale #множитель хз от куда
			instate.position=$"../shoot_point".position
			instate.rotation=direction.angle()
			instate.damage=damage
			instate.gunslinger=creature
			damage = base_damage
			add_child(instate)
			bullets_left -= 1
	elif Time.get_ticks_msec()-time>=reload_time_ms:
		bullets_left = clip_size
		
			
	
	

#func _physics_process(delta):
	#global_position=Vector2()
