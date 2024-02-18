extends Node2D
var ray: RayCast2D
var child_ray: Array[RayCast2D]
var enemy: Array[Creature]
var i_see_player: bool 

func fog_of_war(obj:Creature) -> bool:
	i_see_player = false
	#if child_ray:
		#for child in child_ray:
			#if child != null:				
				#if child.get_collider() != null:
					#if child.get_collider().get_class() == "CharacterBody2D":
						#enemy.append(child.get_collider())
						#for element in enemy:
							#if element != null and obj.is_player == true:
								#element.visible = true
					#else:
						#for element in enemy:
							#if element != null and obj.is_player == true:
								##print(element)
								#element.visible = false
						#enemy = []

		
	#for child in child_ray:
		#if child != null:
			#child.queue_free()	
			#child_ray = []
	#print("\n\n")
	#for element in obj.enemy_in_detector_area:
		#ray = RayCast2D.new()
		#ray.set_hit_from_inside(true)
		#ray.collision_mask = 1
		#ray.collide_with_bodies = true
		##ray.global_position = obj.position
		#ray.target_position = element.position - obj.position
		#obj.add_child(ray)
		#if obj.name == "player":
			#print(obj.get_children())
		#for child in obj.get_children():
			#if child.get_class() == "RayCast2D" and not child in child_ray:
				#child_ray.append(child)
				##if obj.name == "player":
					##print (obj.get_children())
				#continue
					#
					#
	#if obj.is_player == false:
		#for element in enemy:
			#if element.name == "player" and element != null:
				#i_see_player = true
	
	return i_see_player
		
		
		

