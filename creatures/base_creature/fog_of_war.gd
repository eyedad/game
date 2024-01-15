extends Node2D
var ray: RayCast2D
var child_ray: RayCast2D

func fog_of_war(obj:Creature):
	if child_ray:
		#print(child_ray.get_collider())
		child_ray.queue_free()
		#if child_ray.get_collider():
			#if child_ray.get_collider().name == "skeleton":
				#child_ray.get_collider().set_modulate(1, 1,  1, 1)
		#
		
	if obj.enemy_in_detector_area:
		ray = RayCast2D.new()
		
		ray.set_hit_from_inside(true)
		ray.collision_mask = 1
		ray.collide_with_bodies = true
		#ray.global_position = obj.position
		ray.target_position = obj.enemy_in_detector_area[0].position - obj.position
		obj.add_child(ray)
		
		
		
		for element in obj.get_children():
			if element.get_class() == "RayCast2D":
				child_ray = element
				#print(child_ray)
				
				continue
		
		
		
		

