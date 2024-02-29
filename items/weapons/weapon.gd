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
var bullets_left=0
var time=0
var random_number = randf_range(-0.3, 0.3)


func attack(enemy: Creature):
	if bullets_left > 0:
		if Time.get_ticks_msec()-time>=attack_speed_ms*(1+random_number):
			time=Time.get_ticks_msec()
			var creature=$"../../"
			var direction
			var current_scene = get_tree().get_current_scene()
			var shoot_point = creature.get_node("shoot_point")
			var global_shoot_point_position = shoot_point.global_transform.origin
			var instate=attack_scene.instantiate()
			
			if creature.is_player != true:
				direction = instate.preem(enemy, creature, global_shoot_point_position)
				
			else:
				direction = (get_global_mouse_position() - global_shoot_point_position).normalized()
			#print(instate.speed)
			instate.position=global_shoot_point_position
			instate.rotation=direction.angle()
			instate.damage=damage
			instate.gunslinger=creature
			damage = base_damage
			current_scene.add_child(instate)
			bullets_left -= 1
	elif Time.get_ticks_msec()-time>=reload_time_ms:
		bullets_left = clip_size
		

		
			

func _physics_process(delta):
	global_position=Vector2()
