extends Node2D
func manual_control_move(delta, obj:Creature, global_mouse_position:Vector2):
	obj.velocity=Vector2()
	#obj.camera = camera
	if Input.is_action_pressed("right"):
		obj.velocity.x += 1
	if Input.is_action_pressed("left"):
		obj.velocity.x -= 1
	if Input.is_action_pressed("down"):
		obj.velocity.y += 1
	if Input.is_action_pressed("up"):
		obj.velocity.y -= 1
	# Нормализация вектора скорости, чтобы движение по диагонали не было быстрее
	obj.velocity = obj.velocity.normalized() * obj.speed
	if not obj.weapon == null and Input.is_action_pressed("attack"):
		obj.weapon.attack(null)
	
	if Input.is_action_just_pressed("inventory"):
		obj.get_node("viewer/show_inventory").show_inventory()
		
var enemy_last_position: Vector2
func auto_control_move(delta, obj:Creature):
	obj.velocity=Vector2()
	var enemy
	if obj.enemy_in_detector_area.size() > 0:
		enemy = obj.enemy_in_detector_area[0]
	if enemy:
		obj.i_see_enemy=true    #--------------------------------------------------------T_SEE_ENEMY=TRUE   - delete this
		#print(obj.i_see_enemy)
		if not obj.weapon == null:
			var vector_to_enemy:Vector2 
			if obj.i_see_enemy == true:			
				obj.nav_agent.target_position = enemy.position	
				enemy_last_position = obj.nav_agent.target_position
				obj.weapon.attack(enemy)
			
#-------------------------------- MOVEMENT ----------------------------------------
			vector_to_enemy = enemy.position - obj.position
			if vector_to_enemy.length() >= obj.combat_distance:
				obj.velocity = (-obj.global_position + obj.nav_agent.get_next_path_position()).normalized() * obj.speed
				#print((-obj.global_position + obj.nav_agent.get_next_path_position()).normalized() * obj.speed)

				#print(obj.nav_agent.)
		
	elif enemy == null and enemy_last_position != Vector2():
		var vector_to_enemy_last_position = enemy_last_position - obj.position
		obj.velocity = (-obj.global_position + obj.nav_agent.get_next_path_position()).normalized() * obj.speed
		if vector_to_enemy_last_position.length() < 20:
			obj.velocity = Vector2()
			
func get_added_enemies(new_enemies, previous_enemies):
	var added_enemies = []
	for enemy in new_enemies:
		if enemy not in previous_enemies:
			added_enemies.append(enemy)
	return added_enemies

func get_removed_enemies(new_enemies, previous_enemies):
	var removed_enemies = []
	for enemy in previous_enemies:
		if enemy not in new_enemies:
			removed_enemies.append(enemy)
	return removed_enemies

	
func damages_state(delta, obj:Creature):
	#print("damaged")
	obj.velocity=Vector2()
	
